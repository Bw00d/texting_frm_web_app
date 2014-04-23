
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
