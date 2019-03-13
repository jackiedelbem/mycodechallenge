FactoryBot.define do
  factory :account do
    association :user
    
    description { "Test" }
    current_balance { Faker::Number.decimal(2, 3) }
  end
end