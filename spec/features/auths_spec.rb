require 'spec_helper'
require 'rails_helper'

# RSpec.feature "Auths", type: :feature do
  # pending "add some scenarios (or delete) #{__FILE__}"
feature 'the signup process' do
  background :each do
      visit new_user_url  #lead us to the new user url page
  end
  scenario 'has a new user page' do
    expect(page).to have_content('Create New User')
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      fill_in 'Username', with: 'richard'
      fill_in 'Password', with: '123456'
      click_button "Sign-Up"
      expect(page).to have_content('richard')
    end
  end
end

feature 'logging in' do
  background :each do
      visit new_session_url  #lead us to the new user url page
  end
  scenario 'shows username on the homepage after login' do
    User.create(username: "ti3", password: "123456")
    fill_in 'Username', with: "ti3"
    fill_in 'Password', with: '123456'
    click_button "Log-In"
    save_and_open_page
    expect(page).to have_content("ti3")
  end

end

feature 'logging out' do
  background :each do
    user = User.create(username: "ti3", password: "123456")
    login_user(user)
    visit user_url(user)
  end


  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end

# end
