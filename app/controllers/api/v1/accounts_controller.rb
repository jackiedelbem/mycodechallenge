module Api
	module V1
		class AccountsController < ApplicationController
      			
			# List all Accounts
      def index
        accounts = Account.all
				render json: {status: 'SUCCESS', message:'Contas carregadas', data: accounts},status: :ok
      end
      
      # Return Account by id
      def show
        account = Account.find_by id: params[:id]

        if account
          render json: {status: 'SUCCESS', message:'Conta cadastrada', data:account},status: :ok
				else
					render json: {status: 'ERROR', message:'Conta não cadastrada', data:nil},status: :not_found
				end
      end
      
		end
	end
end