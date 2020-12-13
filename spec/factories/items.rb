FactoryBot.define do
  factory :item do
    title {Faker::Lorem.word}
    explanation {Faker::Lorem.sentence}
    image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    video {File.open("#{Rails.root}/public/images/test_video.mp4")}
    user
    collection 
  end
end