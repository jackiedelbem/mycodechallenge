require 'rails_helper'

RSpec.describe User, type: :model do

  
  
  describe 'associations' do
    it { is_expected.to have_many(:accounts) }
  end

  describe 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:email) }
    end

    context 'length' do
      it { is_expected.to validate_length_of(:name).is_at_most(250) }
    end

    context 'uniqueness' do
      it { is_expected.to validate_uniqueness_of(:email) }
    end
  end

  describe 'create user' do
    
    it "is valid with valid attributes" do
      user = FactoryBot.create(:user, email:'teste@teste.com')
      expect(user).to be_valid
    end

    it "is not create user" do
      new_user = FactoryBot.build(:user, email: 'email@email.com', name: 'Test')
      expect(new_user).to_not be_valid
    end
  end

end
