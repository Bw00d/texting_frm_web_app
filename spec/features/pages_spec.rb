require 'spec_helper'

feature 'homepage' do
  before { visit root_url }

  it 'should have header "Textual Satisfaction"' do
    expect(page).to have_content "Textual Satisfaction"
  end

  it 'should have appropriate title' do
    expect(page).to have_title "Textual Satisfaction"
  end

  describe 'header' do
    it 'should have "Login" link to the login page' do
      click_link 'Login'
      expect(page).to have_title "Login | Textual Satisfaction"
    end

    it 'should have a "Sign up" link to the signup page' do
      click_link 'Sign up'
      expect(page).to have_title "Sign up | Textual Satisfaction"
    end

    it 'should have a "Textual Satisfaction" link to the homepage' do
      click_link 'Textual Satisfaction'
      expect(page).to have_title "Textual Satisfaction"
    end
  end
end

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

feature 'login page' do
  before { visit new_user_session_path }


  it 'should have appropriate title' do
    expect(page).to have_title "Login | Textual Satisfaction"
  end

  describe 'login' do
      before { create_user }
      before { visit new_user_session_path }
    it 'should allow a user to create a new session with valid information' do
      fill_in 'Email', with: 'example@example.com'
      fill_in 'Password', with: '12345678'
      click_button "Login"
      expect(page).to have_content ("Edit profile")
    end
  end
end

feature 'new message page' do
  before { visit new_message_path }
  before { create_and_signin_user }


  it 'should have the appropriate title' do
    expect(page).to have_title 'New Message | Textual Satisfaction'
  end

  describe 'new message' do

    it 'should not create a message if input is invalid' do
      fill_in "To", with: '000000'
      fill_in "From", with: ''
      fill_in "Body", with: ""
      click_button "Send"
      expect(page).to have_content "You messed something up. Try again."
    end

    # it 'should allow user to send a message with valid input' do
    #   fill_in "To", with: '9714004033'
    #   fill_in "From", with: '5039256254'
    #   fill_in "Body", with: "What up world!?"
    #   click_button "Send"
    #   expect(page).to have_content "Your message was sent."
    # end
  end
end











