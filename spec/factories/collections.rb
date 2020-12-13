FactoryBot.define do
  factory :collection do
    name {Faker::Lorem.word}
    explanation {Faker::Lorem.sentence}
    image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    user
  end
end