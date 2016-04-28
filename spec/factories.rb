FactoryGirl.define do
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
  end

end
