FactoryBot.define do
  factory :notification do
    recipient_id { 1 }
    actor_id { 1 }
    read_at { "" }
    action { "MyString" }
    notifiable_id { 1 }
    notifiable_type { "MyString" }
  end

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