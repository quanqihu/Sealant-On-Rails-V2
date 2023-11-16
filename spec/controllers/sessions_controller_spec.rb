# spec/controllers/sessions_controller_spec.rb

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    it 'redirects to root path if user is already logged in' do
      user = User.create(username: 'testuser', password: 'password123') # Create a User instance

      session[:user_id] = user.id

      get :new

      expect(response).to redirect_to(root_path)
    end

    it 'renders the new template if user is not logged in' do
      get :new

      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    it 'logs in with valid credentials' do
      user = User.create(username: 'testuser', password: 'password123') # Create a User instance

      post :create, params: { session: { username: 'testuser', password: 'password123' } }

      expect(session[:user_id]).to eq(user.id)
      expect(response).to redirect_to(root_path)
    end

    it 'redirects to login path with invalid credentials' do
      post :create, params: { session: { username: 'invaliduser', password: 'invalidpassword' } }

      expect(session[:user_id]).to be_nil
      expect(flash[:error]).to eq('Invalid username or password')
      expect(response).to redirect_to(login_path)
    end
  end

  describe 'DELETE #destroy' do
    it 'logs out the user and redirects to root path' do
      user = User.create(username: 'testuser', password: 'password123') # Create a User instance

      session[:user_id] = user.id

      delete :destroy

      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(root_path)
    end
  end

#   describe 'POST #omniauth' do
#     before do
#       request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google] # Replace with your actual provider and data
#     end

#     it 'creates a new user with valid OmniAuth data' do
#       expect {
#         post :omniauth
#       }.to change(User, :count).by(1)

#       expect(session[:user_id]).to eq(User.last.id)
#       expect(response).to redirect_to(root_path)
#     end

#     it 'renders the new template with invalid OmniAuth data' do
#       allow(User).to receive(:find_or_create_by).and_return(User.new) # Simulate invalid data

#       post :omniauth

#       expect(session[:user_id]).to be_nil
#       expect(response).to render_template('new')
#     end
#   end
end
