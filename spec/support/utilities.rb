def create_user
  visit new_user_registration_path
  @test_user = User.create(email: 'example@example.com', password: '12345678', password_confirmation: '12345678')

end

def sign_in
  fill_in "Email", :with => "example@example.com"
  fill_in "Password", :with => "12345678"
  click_button 'Login'
end

def create_and_signin_user
  create_user
  visit new_user_session_path
  sign_in
end

# def create_and_signin_user
#   visit root_url
#   create_user
#   sign_in
# end
