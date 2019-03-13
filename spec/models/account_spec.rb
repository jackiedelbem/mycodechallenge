require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:account_entries) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:current_balance) }
      it { is_expected.to validate_presence_of(:description) }
    end

    context 'numericality' do
      it { is_expected.to validate_numericality_of(:current_balance).is_greater_than_or_equal_to(0) }
    end
  end

  describe 'create' do

    it "is valid" do
      account = FactoryBot.create(:account)
      expect(account).to be_valid
    end

    it "is not valid" do
      account = FactoryBot.build(:account, current_balance: -1)
      expect(account).to_not be_valid
    end

  end
end
