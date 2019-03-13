class AccountEntry < ApplicationRecord

  belongs_to :account

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :entry_type, presence: true

  enum entry_type: [ :in, :out ]
end
