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
