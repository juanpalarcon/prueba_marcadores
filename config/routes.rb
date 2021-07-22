Rails.application.routes.draw do
  resources :types
  resources :markers
  resources :categories


  get 'markers/my_category/:json_id', to: 'markers#my_category'

  root 'markers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
