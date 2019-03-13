class User < ApplicationRecord

  has_many :accounts, -> { order current_balance: :desc }

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 250 }

end
