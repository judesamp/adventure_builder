FactoryGirl.define do

  factory :choice do
    content Faker::Lorem.word
    scene nil
  end

  factory :scene do
    content Faker::Lorem.word
    adventure nil
  end

  factory :adventure do
    title Faker::Lorem.sentence(2)
    author Faker::Name.name
    description Faker::Lorem.paragraph
  end

  factory :published_adventure do
    title Faker::Lorem.sentence(2)
    author Faker::Name.name
    description Faker::Lorem.paragraph
    published true
  end

  factory :user do
    sequence(:email) {|n| "storm.trooper.#{n}@factory.com" }
    password "password"
    password_confirmation "password"

    factory :user_with_adventures do
      after(:build) do |user, evaluator|
        create_list(:adventure, 5, user: user)
      end
    end

  end

end
