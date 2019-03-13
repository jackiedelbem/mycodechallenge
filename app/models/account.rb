class Account < ApplicationRecord
  belongs_to :user
  has_many :account_entries, -> { order created_at: :desc }

  validates :current_balance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true

  def add_account_entry(entry_type:, amount:)
    account_entry = account_entries.build(entry_type: entry_type, amount: amount, account: self)
    if amount > current_balance && account_entry.out?
      raise 'A conta de origem não possui saldo suficiente'
    end
    self.current_balance += account_entry.in? ? amount : -amount
    account_entry
  end

end
