Rails.application.routes.draw do
  get 'welcome/index'

  resources :lists do
  	resources :simple_tasks 
  end
  resources :lists do
   resources :long_tasks 
  end
  resources :lists do 
    resources :temporal_tasks
  end  
  
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
