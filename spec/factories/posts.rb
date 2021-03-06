FactoryBot.define do
  factory :post do
    title       {Faker::Lorem.sentence}
    sentence    {"testtest"}
    genre_id    {2}

    association :user 
  end
  after(:build) do |post|
    post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end
