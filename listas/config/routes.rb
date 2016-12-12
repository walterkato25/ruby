Rails.application.routes.draw do
  get 'welcome/index'

  resources :lists do
  	resources :simple_tasks 
    resources :long_tasks 
    resources :temporal_tasks
  end  
  #root 'lists#new'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
