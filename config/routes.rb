Rails.application.routes.draw do
  delete '/products/:id', to: 'products#destroy'
  patch '/products/:id', to: 'products#update'
  post '/products', to: 'products#create'
  get '/products/new', to: 'products#new', as: :new_product
  # Index trabaja con un conjunto de elementos
  get '/products', to: 'products#index'
  # Show trabaja con un unico elemento
  get '/products/:id', to: 'products#show', as: :product
  get '/products/:id/edit', to: 'products#edit', as: :edit_product
end
