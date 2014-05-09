# == Route Map (Updated 2014-05-06 00:12)
#
#                   Prefix Verb   URI Pattern                     Controller#Action
#                  contact GET    /contact(.:format)              pages#contact
#           privacy_policy GET    /privacy_policy(.:format)       pages#privacy_policy
#         terms_of_service GET    /terms_of_service(.:format)     pages#terms_of_service
#                    about GET    /about(.:format)                pages#about
#              user_groups GET    /user_groups(.:format)          user_groups#index
#                          POST   /user_groups(.:format)          user_groups#create
#           new_user_group GET    /user_groups/new(.:format)      user_groups#new
#          edit_user_group GET    /user_groups/:id/edit(.:format) user_groups#edit
#               user_group GET    /user_groups/:id(.:format)      user_groups#show
#                          PATCH  /user_groups/:id(.:format)      user_groups#update
#                          PUT    /user_groups/:id(.:format)      user_groups#update
#                          DELETE /user_groups/:id(.:format)      user_groups#destroy
#         new_user_session GET    /users/sign_in(.:format)        devise/sessions#new
#             user_session POST   /users/sign_in(.:format)        devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)       devise/sessions#destroy
#            user_password POST   /users/password(.:format)       devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)   devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)  devise/passwords#edit
#                          PATCH  /users/password(.:format)       devise/passwords#update
#                          PUT    /users/password(.:format)       devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)         registrations#cancel
#        user_registration POST   /users(.:format)                registrations#create
#    new_user_registration GET    /users/sign_up(.:format)        registrations#new
#   edit_user_registration GET    /users/edit(.:format)           registrations#edit
#                          PATCH  /users(.:format)                registrations#update
#                          PUT    /users(.:format)                registrations#update
#                          DELETE /users(.:format)                registrations#destroy
#                     user GET    /users/:id(.:format)            users#show
#                     root GET    /                               welcome#index
#

Rails.application.routes.draw do

  get '/dashboard' => 'dashboard#show'
  get '/dashboard/:id' => 'dashboard#show'

  get '/contact' => 'pages#contact'
  get '/privacy_policy' => 'pages#privacy_policy'
  get '/terms_of_service' => 'pages#terms_of_service'
  get '/about' => 'pages#about'

  resources :user_groups
  resources :profiles

  devise_for :users, controllers: { registrations: 'registrations' }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
