FactoryBot.define do
    factory :user do
      email { Faker::Internet.unique.email }
      password {'password'}
      password_confirmation {'password'}
      username { Faker::Name.unique.name}
      id {Faker::Number.unique.number(digits: 10)}
    end
  end