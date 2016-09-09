Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', as: 'signout'

  resources :people
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1 do
      resources :people, only: [:index, :show] do
        collection do
          get 'search'
        end 
      end  
    end
  end
  
  resources :institutions
   
  get '/api', to: 'home#api'
  get '/help', to: 'home#help'

  root 'home#index' 
 
end
