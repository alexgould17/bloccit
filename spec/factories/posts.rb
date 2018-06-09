FactoryGirl.define do
  factory :post do
    title Faker::Simpsons.character
    body Faker::Simpsons.quote
    topic
    user
    rank 0.0
  end
end
