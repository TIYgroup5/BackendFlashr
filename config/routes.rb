Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

### Registration Routes

post "signup", to: "registrations#create"
delete "signup", to: "registrations#destroy"

post "login", to: "registrations#login"

### Deck Routes

get "decks", to: "decks#index"
post "decks", to: "decks#create"
put "/decks/:id", to: "decks#update"
delete "/decks/:id", to: "decks#destroy"

### Card Routes

get "decks/:id/cards", to: "cards#index"
get "cards/:id", to: "cards#show"
post "decks/:id/cards", to: "cards#create"
put "cards/:id", to: "cards#update"
delete "cards/:id", to: "cards#destroy"

### Guess Routes

get "guesses/:id", to: "user_guesses#show"
post "cards/:id/guesses", to: "user_guesses#new"

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
