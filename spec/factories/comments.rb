FactoryBot.define do
  factory :comment do
    message     {"test"}

    association :user 
    association :post
  end
end