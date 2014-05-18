# == Route Map (Updated 2014-05-16 14:01)
#
#                   Prefix Verb   URI Pattern                            Controller#Action
#       search_suggestions GET    /search_suggestions(.:format)          search_suggestions#index
#                          POST   /search_suggestions(.:format)          search_suggestions#create
#    new_search_suggestion GET    /search_suggestions/new(.:format)      search_suggestions#new
#   edit_search_suggestion GET    /search_suggestions/:id/edit(.:format) search_suggestions#edit
#        search_suggestion GET    /search_suggestions/:id(.:format)      search_suggestions#show
#                          PATCH  /search_suggestions/:id(.:format)      search_suggestions#update
#                          PUT    /search_suggestions/:id(.:format)      search_suggestions#update
#                          DELETE /search_suggestions/:id(.:format)      search_suggestions#destroy
#                  contact GET    /contact(.:format)                     pages#contact
#           privacy_policy GET    /privacy_policy(.:format)              pages#privacy_policy
#         terms_of_service GET    /terms_of_service(.:format)            pages#terms_of_service
#                    about GET    /about(.:format)                       pages#about
#              user_groups GET    /user_groups(.:format)                 user_groups#index
#                          POST   /user_groups(.:format)                 user_groups#create
#           new_user_group GET    /user_groups/new(.:format)             user_groups#new
#          edit_user_group GET    /user_groups/:id/edit(.:format)        user_groups#edit
#               user_group GET    /user_groups/:id(.:format)             user_groups#show
#                          PATCH  /user_groups/:id(.:format)             user_groups#update
#                          PUT    /user_groups/:id(.:format)             user_groups#update
#                          DELETE /user_groups/:id(.:format)             user_groups#destroy
#         new_user_session GET    /users/sign_in(.:format)               devise/sessions#new
#             user_session POST   /users/sign_in(.:format)               devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)              devise/sessions#destroy
#            user_password POST   /users/password(.:format)              devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)          devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)         devise/passwords#edit
#                          PATCH  /users/password(.:format)              devise/passwords#update
#                          PUT    /users/password(.:format)              devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                registrations#cancel
#        user_registration POST   /users(.:format)                       registrations#create
#    new_user_registration GET    /users/sign_up(.:format)               registrations#new
#   edit_user_registration GET    /users/edit(.:format)                  registrations#edit
#                          PATCH  /users(.:format)                       registrations#update
#                          PUT    /users(.:format)                       registrations#update
#                          DELETE /users(.:format)                       registrations#destroy
#             user_profile POST   /users/:user_id/profile(.:format)      profiles#create
#         new_user_profile GET    /users/:user_id/profile/new(.:format)  profiles#new
#        edit_user_profile GET    /users/:user_id/profile/edit(.:format) profiles#edit
#                          GET    /users/:user_id/profile(.:format)      profiles#show
#                          PATCH  /users/:user_id/profile(.:format)      profiles#update
#                          PUT    /users/:user_id/profile(.:format)      profiles#update
#                          DELETE /users/:user_id/profile(.:format)      profiles#destroy
#                    users GET    /users(.:format)                       users#index
#                          POST   /users(.:format)                       users#create
#                 new_user GET    /users/new(.:format)                   users#new
#                edit_user GET    /users/:id/edit(.:format)              users#edit
#                     user GET    /users/:id(.:format)                   users#show
#                          PATCH  /users/:id(.:format)                   users#update
#                          PUT    /users/:id(.:format)                   users#update
#                          DELETE /users/:id(.:format)                   users#destroy
#                     root GET    /                                      welcome#index
#

Rails.application.routes.draw do
  resources :search_suggestions

  get '/contact' => 'pages#contact'
  get '/privacy_policy' => 'pages#privacy_policy'
  get '/terms_of_service' => 'pages#terms_of_service'
  get '/about' => 'pages#about'

  resources :user_groups

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users do
    resource :profile
  end

  root 'welcome#index'
end
