FactoryBot.define do
  factory :user do
    username { "dummyUser" }
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

  factory :pet do
    name { "CatDog" }
    breed { "Cat" }
    species { "Dog" }
    association :user
  end

  factory :post do
    content { "testing" }
    association :user
    association :pet
  end
end