require 'rails_helper'
require './spec/support/omniauth'

describe 'root path visitation' do
  scenario 'logging in' do
    VCR.use_cassette('features/user_can_login_with_google') do
      visit '/'

      within('.google-welcome') do
        click_on 'Google'
      end

      expect(current_path).to eq('/thor-odinson')
      expect(page).to have_content('thor-odinson')
    end
  end
end
