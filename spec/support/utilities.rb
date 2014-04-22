def create_user
  visit new_user_registration_path
  @user = FactoryGirl.create(:user)
end
