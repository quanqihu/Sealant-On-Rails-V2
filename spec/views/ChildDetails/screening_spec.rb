# spec/features/screening_spec.rb

require 'rails_helper'

RSpec.feature 'Screening page' do
  scenario 'displays the screening page and interacts with popups' do
    visit '/screening'  # Adjust the URL to match your route

    # Test the initial state of the page
    expect(page).to have_content('Screening')
    expect(page).to have_selector('.button', count: 32)
    expect(page).to have_selector('.popup-container', count: 32)
    expect(page).to have_content('Untreated Cavities: 0')
    expect(page).to have_content('Caries Experience: 0')
    expect(page).to have_content('Sealants Present: 0')
    expect(page).to have_content('Referred for treatment: 0')

    # Test interacting with popups
    # You can use Capybara to click buttons, select radio options, etc.
    find('.button', text: '31').click
    within('.popup-container', text: '31') do
      find('.popup-box-small label', text: 'D - Decay').click
      find('button', text: 'Close').click
    end

    # Ensure the selected option appears in the corresponding cell
    within('.popup-container', text: '31') do
      expect(page).to have_content('D - Decay')
    end

    # Test updates to the summary elements
    expect(page).to have_content('Untreated Cavities: 1')
    expect(page).to have_content('Caries Experience: 0')
    expect(page).to have_content('Sealants Present: 0')
    expect(page).to have_content('Referred for treatment: 0')
  end

  # Add more scenarios to test other interactions and functionality
end