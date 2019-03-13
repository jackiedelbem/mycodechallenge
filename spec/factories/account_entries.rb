FactoryBot.define do
  factory :account_entry do
    account_id { 1 }
    entry_type { 1 }
    amount { "9.99" }
  end
end
