class Account < ApplicationRecord
  belongs_to :user
  has_many :account_entries, -> { order created_at: :desc }

  validates :current_balance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true

end
