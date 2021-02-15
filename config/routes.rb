Rails.application.routes.draw do

  resources :products, only: [:new, :create, :edit, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: redirect('/products')

  get '/say_hi', to: 'testing_pull_requests#say_hi', format: false
end
