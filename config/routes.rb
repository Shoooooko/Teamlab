Rails.application.routes.draw do
  get 'posts/index'=>"posts#index"
  get '/top'=>"home#top"
  get '/detail'=>"home#detail"

  resources :products
  '''
  Prefix         Verb     URI Pattern                   Controller#Action
  products       GET      /products(.:format)           products#index
                 POST     /products(.:format)           products#create
  new_product    GET      /products/new(.:format)       products#new
  edit_product   GET      /products/:id/edit(.:format)  products#edit
  product        GET      /products/:id(.:format)       products#show
                 PATCH    /products/:id(.:format)       products#update
                 PUT      /products/:id(.:format)       products#update
                 DELETE   /products/:id(.:format)       products#destroy
  '''
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
