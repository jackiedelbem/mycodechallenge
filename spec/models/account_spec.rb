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

  describe '#add_account_entry' do
    subject(:account) { FactoryBot.build(:account, current_balance: 100) }
    let(:amount) { 10 }

    context 'when add an entry_type - in' do
      let(:entry_type) { :in }
      
      subject { account.add_account_entry(entry_type: entry_type, amount: amount) }
      it { is_expected.to be_a AccountEntry }
      it { expect { subject }.to change { account.current_balance }.from(100).to(110) }
      it { expect { subject }.to change { account.account_entries.to_a.count }.from(0).to(1) }
    end

    context 'when add an entry_type - out' do
      let(:entry_type) { :out }
 
      subject { account.add_account_entry(entry_type: entry_type, amount: amount) }
      it { is_expected.to be_a AccountEntry }
      it { expect { subject }.to change { account.current_balance }.from(100).to(90) }
      it { expect { subject }.to change { account.account_entries.to_a.count }.from(0).to(1) }
    end

    context 'when entry_type is out and amount greater than the current balance' do
      let(:entry_type) { :output }
      let(:amount) { 110 }
  
      subject { account.add_account_entry(entry_type: entry_type, amount: amount) }
      it { expect { subject }.to raise_error }
    end
  end




end
