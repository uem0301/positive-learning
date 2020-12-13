FactoryBot.define do
  factory :user do
    name              {Faker::Name.name}
    password          {Faker::Internet.password(min_length:6)}
    sequence(:email)  {Faker::Internet.email}
  end
end