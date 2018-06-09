FactoryGirl.define do
  pw = "wsxedc"
  factory :user do
    name Faker::OnePiece.character
    sequence(:email){|n| "test_user#{n}@test.test"}
    password pw
    password_confirmation pw
    role :member
  end
end
