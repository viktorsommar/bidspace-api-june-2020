Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    namespace :v1 do 
      resources  :listings, only: [:index, :show, :create], constraints: {format: 'json'}
    end
  end  
end
