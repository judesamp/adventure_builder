FactoryGirl.define do

  factory :choice do
    content "MyText"
    scene nil
  end

  factory :scene do
    content "MyText"
    adventure nil
  end

  factory :adventure do
    title "Adventure Title"
    author "Adventure Author"
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
