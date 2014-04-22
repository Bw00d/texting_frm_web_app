FactoryGirl.define do
  factory :user do
    email "user@example.org"
    password 'foobarbaz'
    password_confirmation 'foobarbaz'
  end
end
