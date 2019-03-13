require 'rails_helper'

RSpec.describe AccountEntry, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:account) }
  end

  describe 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:amount) }
      it { is_expected.to validate_presence_of(:entry_type) }
    end

    context 'numericality' do
      it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }
    end
  end

  describe 'create' do

    it "is valid" do
      account = FactoryBot.create(:account_entry)
      expect(account).to be_valid
    end

    it "is not valid" do
      account = FactoryBot.build(:account_entry, amount: 0)
      expect(account).to_not be_valid
    end

  end
end
