require 'rails_helper'

RSpec.describe Api::V1::AccountsController, type: :controller do
  render_views

  describe 'GET :index' do
    let!(:user) { FactoryBot.create(:user)}
    let!(:account_1) { FactoryBot.create(:account, user: user) }
    let!(:account_2) { FactoryBot.create(:account, user: user) }

    it 'should return a list of accounts with success status' do
      get :index
      body_reponse = JSON.parse(response.body)
      accounts = body_reponse["data"]

      expect(response).to have_http_status(:success)
      expect(body_reponse).to include("data")
      expect(accounts.count).to eq 2
    end

  end

  describe 'GET :show' do
    let!(:user) { FactoryBot.create(:user)}
    let!(:account) { FactoryBot.create(:account, user: user) }

    context 'when success' do
      it 'should return the account' do
        get :show, params: { id: account.id }
        body_reponse = JSON.parse(response.body)
        account_response = body_reponse["data"]

        expect(response).to have_http_status(:success)
        expect(account_response).to include('id' => account.id)
        expect(account_response).to include('description' => account.description)
      end
    end

    context 'when error' do
      it 'should return a message with not found' do
        get :show, params: { id: 'xxx' }
        response_json = JSON.parse(response.body)

        expect(response).to have_http_status(:not_found)
        expect(response_json).to include('message' => 'Conta não cadastrada')
      end
    end
  end
end