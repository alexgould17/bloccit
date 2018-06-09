FactoryGirl.define do
  factory :topic do
    name Faker::LeagueOfLegends.champion
    description Faker::LeagueOfLegends.quote
  end
end
