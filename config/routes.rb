Rails.application.routes.draw do
  Rails.application.routes.draw do
  namespace 'api', defaults: { format: :json } do
  	namespace 'v1' do
      resources :accounts, only: [:index, :show]

      namespace 'operations' do
        post 'transfer', to: 'transfer#create', as: :create
      end

  	end
  end
end
end
