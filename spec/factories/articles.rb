FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.word }
    url { Faker::Internet.url }
    shared_by { Faker::StarWars.character }
    user_id nil
  end
end