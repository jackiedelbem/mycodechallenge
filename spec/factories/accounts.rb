FactoryBot.define do
  factory :account do
    association :user
    
    description { "Test" }
    current_balance { Faker::Number.decimal(2, 2) }
  end
end