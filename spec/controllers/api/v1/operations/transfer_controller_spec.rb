require 'rails_helper'

RSpec.describe Api::V1::Operations::TransferController, type: :controller do
  describe 'POST :create' do
    let!(:user) { FactoryBot.create(:user)}
    let!(:account_source) { FactoryBot.create(:account, current_balance: 150, user: user) }
    let!(:account_destination) { FactoryBot.create(:account, current_balance: 100, user: user) }

    it 'should returns not found status - source account not found' do
      post :create, params: { source_account_id: 'not_found', destination_account_id: account_destination.id, amount: 20 }

      expect(response).to have_http_status(:not_found)
    end

    it 'should returns not found status - destination account not found' do
      post :create, params: { source_account_id: account_source.id, destination_account_id: 'not_found', amount: 20 }

      expect(response).to have_http_status(:not_found)
    end

    it 'should returns bad request status - amount <= 0' do
      post :create, params: { source_account_id: account_source.id, destination_account_id: account_destination.id, amount: 0 }

      expect(response).to have_http_status(:bad_request)
    end

    it 'should transfer the amount and returns success status' do
      post :create, params: { source_account_id: account_source.id, destination_account_id: account_destination.id, amount: 10 }

      expect(response).to have_http_status(:success)
      expect(account_source.reload.current_balance).to eq 140
      expect(account_destination.reload.current_balance).to eq 110
    end

   end
end