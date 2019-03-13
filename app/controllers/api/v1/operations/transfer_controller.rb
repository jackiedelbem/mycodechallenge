module Api
  module V1
    module Operations
      class TransferController < ApplicationController
        before_action :set_source_account
        before_action :set_destination_account
        before_action :set_amount

        def create
          ActiveRecord::Base.transaction do
            @source_account.add_account_entry(entry_type: :out, amount: @amount)
            @destination_account.add_account_entry(entry_type: :in, amount: @amount)
            @source_account.save!
            @destination_account.save!

            render json: { message: 'Transferência executada com sucesso' }, status: :ok
          end
        rescue e
          render json: { message: e.message }, status: :bad_request
        end

        private

        def set_source_account
          @source_account = Account.find_by id: params[:source_account_id]
          render json: { message: 'Conta de origem não encontrada' }, status: :not_found if @source_account.nil?
        end

        def set_destination_account
          @destination_account = Account.find_by id: params[:destination_account_id]
          render json: { message: 'Conta de destino não encontrada' }, status: :not_found if @destination_account.nil?
        end

        def set_amount
          @amount = BigDecimal.new(params[:amount])
          render json: { message: 'Valor de transfência deve ser maior que zero' }, status: :bad_request if @amount <= 0
        end
      end
    end
  end
end