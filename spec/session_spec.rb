require 'rails_helper'

RSpec.describe 'Session', type: :system do
  describe 'login' do
    before(:each) do
      visit root_path
    end

    it 'checks if it shows sign in page if not signed in' do
      expect(page).to have_content 'Sign in'
    end
    it 'logs in valid user' do
      User.create(name: 'test', email: 'test@test.com', password: '123456')
      fill_in 'user[email]', with: 'test@test.com'
      fill_in 'user[password]', with: '123456'
    end
    it 'fills clicks submit button' do
      click_button 'commit'
    end
  end
end
