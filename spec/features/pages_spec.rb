require 'spec_helper'

feature 'homepage' do
  before { visit root_url }

  it 'should have appropriate title' do
    expect(page).to have_title "Text Friends"
  end

  describe 'header' do
    it 'should have "Login" link to the login page' do
      click_link 'Login'
      expect(page).to have_title "Login | Text Friends"
    end

    it 'should have a "Sign up" link to the signup page' do
      click_link 'Sign up'
      expect(page).to have_title "Sign up | Text Friends"
    end

    it 'should have a "Text Friends" link to the homepage' do
      click_link 'Text Friends'
      expect(page).to have_title "Text Friends"
    end
  end
end

feature 'sign up page' do
  before  { visit new_user_registration_path }

  it 'should have appropriate title' do
    expect(page).to have_title "Sign up | Text Friends"
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

feature 'login page' do
  before { visit new_user_session_path }


  it 'should have appropriate title' do
    expect(page).to have_title "Login | Text Friends"
  end

  describe 'login' do
      before { create_user }
    it 'should allow a user to create a new session with valid information' do
      fill_in 'Email', with: 'user@example.org'
      fill_in 'Password', with: 'foobarbaz'
      click_button "Login"
      expect(page).to have_content ("Edit profile")
    end
  end
end
