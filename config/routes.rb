Rails.application.routes.draw do
  resources :types
  resources :markers
  resources :categories


  get 'marker_category/' , to: 'categories#marker_category'


  root 'markers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
