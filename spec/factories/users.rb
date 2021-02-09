FactoryBot.define do
  factory :user do
      nickname               {Faker::Name}
      email                  {Faker::Internet.free_email}
      password               {'test1234'}
      password_confirmation  {password}
      profile                {"よろしくお願いします"}
  
      after(:build) do |user|
        user.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
  end
end
