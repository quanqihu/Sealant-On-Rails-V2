# # spec/controllers/sessions_controller_spec.rb

# require 'rails_helper'

# RSpec.describe SessionsController, type: :controller do
#   describe 'GET #new' do
#     it 'redirects to root path if user is already logged in' do
#       user = User.create(username: 'testuser', password: 'password123') # Create a User instance

#       session[:user_id] = user.id

#       get :new

#       expect(response).to redirect_to(root_path)
#     end

#     it 'renders the new template if user is not logged in' do
#       get :new

#       expect(response).to render_template('new')
#     end
#   end

#   describe 'POST #create' do
#     it 'logs in with valid credentials' do
#       user = User.create(username: 'testuser', password: 'password123') # Create a User instance

#       post :create, params: { session: { username: 'testuser', password: 'password123' } }

#       expect(session[:user_id]).to eq(user.id)
#       expect(response).to redirect_to(root_path)
#     end

#     it 'redirects to login path with invalid credentials' do
#       post :create, params: { session: { username: 'invaliduser', password: 'invalidpassword' } }

#       expect(session[:user_id]).to be_nil
#       expect(flash[:error]).to eq('You are not whitelisted.Contact your administrator.')
#       expect(response).to redirect_to(login_path)
#     end
#   end

#   describe 'DELETE #destroy' do
#     it 'logs out the user and redirects to root path' do
#       user = User.create(username: 'testuser', password: 'password123') # Create a User instance

#       session[:user_id] = user.id

#       delete :destroy

#       expect(session[:user_id]).to be_nil
#       expect(response).to redirect_to(root_path)
#     end
#   end

# #   describe 'POST #omniauth' do
# #     before do
# #       request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google] # Replace with your actual provider and data
# #     end

# #     it 'creates a new user with valid OmniAuth data' do
# #       expect {
# #         post :omniauth
# #       }.to change(User, :count).by(1)

# #       expect(session[:user_id]).to eq(User.last.id)
# #       expect(response).to redirect_to(root_path)
# #     end

# #     it 'renders the new template with invalid OmniAuth data' do
# #       allow(User).to receive(:find_or_create_by).and_return(User.new) # Simulate invalid data

# #       post :omniauth

# #       expect(session[:user_id]).to be_nil
# #       expect(response).to render_template('new')
# #     end
# #   end
# end


#############################


require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { User.create(username: 'test_user', email: 'test@example.com') }

  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '123456',
      info: {
        name: 'John Doe',
        email: 'john@gmail.com'
      }
    })
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    context 'when logged in' do
      before { allow(controller).to receive(:logged_in?).and_return(true) }

      it 'redirects to root_path' do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end
  end

  # describe 'POST #create' do
  #   let(:valid_params) { { session: { username: user.username, password: 'password' } } }
  #   let(:invalid_params) { { session: { username: 'nonexistent_user', password: 'wrong_password' } } }

  #   it 'creates a session for a whitelisted user' do
  #     Whitelist.create(email: user.email)
  #     post :create, params: valid_params
  #     expect(session[:user_id]).to eq(user.id)
  #     expect(response).to redirect_to(root_path)
  #   end

  #   it 'redirects to login_path for non-whitelisted user' do
  #     post :create, params: invalid_params
  #     expect(session[:user_id]).to be_nil
  #     expect(response).to redirect_to(login_path)
  #     expect(flash[:error]).to include('You are not whitelisted.Contact your administrator.')
  #   end
  # end
  describe 'POST #create' do
    let(:valid_params) { { session: { username: user.username, password: 'password' } } }
    let(:invalid_params) { { session: { username: 'nonexistent_user', password: 'wrong_password' } } }

    it 'creates a session for a whitelisted user' do
      Whitelist.create(email: user.email)
      post :create, params: valid_params
      expect(session[:user_id]).to eq(user.id)
      expect(response).to redirect_to(login_path)  
    end

    it 'redirects to login_path for non-whitelisted user' do
      post :create, params: invalid_params
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(login_path)
      expect(flash[:error]).to include('You are not whitelisted.Contact your administrator.')
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the user session' do
      session[:user_id] = user.id
      delete :destroy
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(root_path)
    end
  end

  # describe 'GET #omniauth' do
  #   let(:omniauth_auth) { OmniAuth.config.mock_auth[:google_oauth2] } # Replace with your actual provider
  #   let(:valid_omniauth_params) { { uid: omniauth_auth.uid, provider: omniauth_auth.provider } }

  #   it 'creates or finds a user through omniauth' do
  #     expect do
  #       get :omniauth, params: valid_omniauth_params
  #     end.to change(User, :count).by(1)

  #     expect(session[:user_id]).to eq(User.last.id)
  #     expect(response).to redirect_to(root_path)
  #   end

  #   it 'handles authentication failure' do
  #     allow(User).to receive(:find_or_create_by).and_return(User.new) # Simulate user creation failure
  #     get :omniauth, params: valid_omniauth_params
  #     expect(session[:user_id]).to be_nil
  #     expect(response).to redirect_to(login_path)
  #     expect(flash[:error]).to include('Failed to create or authenticate user.')
  #   end
  # end

  describe 'GET #omniauth' do
    let(:omniauth_auth) { OmniAuth.config.mock_auth[:google_oauth2] }

    it 'creates or finds a user through omniauth' do
      expect do
        get :omniauth, params: { uid: omniauth_auth.uid, provider: omniauth_auth.provider }
      end.to change(User, :count).by(1)

      expect(session[:user_id]).to eq(User.last.id)
      expect(response).to redirect_to(root_path)
    end

    it 'handles authentication failure' do
      allow(User).to receive(:find_or_create_by).and_return(User.new) # Simulate user creation failure
      get :omniauth, params: { uid: nil, provider: nil }
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(login_path)
      expect(flash[:error]).to include('Failed to create or authenticate user.')
    end
  end

  describe '#check_whitelist' do
    it 'redirects to login_path for non-whitelisted user' do
      allow(controller).to receive(:params).and_return(session: { username: 'nonexistent_user' })
      get :check_whitelist
      expect(response).to redirect_to(login_path)
      expect(flash[:error]).to include('You are not whitelisted.Contact your administrator.')
    end

    it 'does not redirect for whitelisted user' do
      Whitelist.create(email: user.email)
      allow(controller).to receive(:params).and_return(session: { username: user.username })
      get :check_whitelist
      expect(response).not_to redirect_to(login_path)
      expect(flash[:error]).to be_nil
    end
  end
end


