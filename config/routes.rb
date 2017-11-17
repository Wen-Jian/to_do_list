Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :lists 

  resources :users do
  	resources :lists, :controller => "user_lists"

  end
  	
  root "users#index"
  
end
