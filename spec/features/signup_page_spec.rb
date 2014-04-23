require 'spec_helper'

feature 'sign up page' do
  before  { visit new_user_registration_path }

  it 'should have appropriate title' do
    expect(page).to have_title "Sign up | Textual Satisfaction"
  end

  describe 'sign up' do

    it 'should let a user sign up with valid information' do
      fill_in 'Email', with: "user@example.com"
      fill_in 'Password', with: "foobarbaz"
      fill_in 'Password confirmation', with: "foobarbaz"
      click_button "Sign up"
      expect(page).to have_content ("Welcome! You have signed up successfully.")
    end

    it 'should not create a new user if password it too short' do
      fill_in 'Email', with: "user@example.com"
      fill_in 'Password', with: "foobar"
      fill_in 'Password confirmation', with: "foobar"
      click_button "Sign up"
      expect(page).to have_content ("Password is too short")
    end

    it 'should not create a new user if email is invalid' do
      fill_in 'Email', with: "user.example.com"
      fill_in 'Password', with: "foobarbaz"
      fill_in 'Password confirmation', with: "foobarbaz"
      click_button "Sign up"
      expect(page).to have_content ("Email is invalid")
    end
  end
end
