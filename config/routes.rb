Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      post '/get_access_token', to: 'plaid#get_access_token'
      get '/transactions', to: 'plaid#transactions'
    end
  end

  # get '/transaction', to: 'api/v1/plaid#transaction'
  # post '/get_access_token', to: 'api/v1/plaid#get_access_token'

end