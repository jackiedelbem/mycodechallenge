FactoryBot.define do
  factory :account_entry do
    association :account

    entry_type { AccountEntry.entry_types.values.sample }
    amount { Faker::Number.decimal(2, 3) }
  end
end
