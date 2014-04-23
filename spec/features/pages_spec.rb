require 'spec_helper'

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
  end
end











