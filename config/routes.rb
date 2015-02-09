# == Route Map
#
#                       Prefix Verb   URI Pattern                        Controller#Action
#                   properties GET    /properties(.:format)              properties#index
#                              POST   /properties(.:format)              properties#create
#                 new_property GET    /properties/new(.:format)          properties#new
#                edit_property GET    /properties/:id/edit(.:format)     properties#edit
#                     property GET    /properties/:id(.:format)          properties#show
#                              PATCH  /properties/:id(.:format)          properties#update
#                              PUT    /properties/:id(.:format)          properties#update
#                              DELETE /properties/:id(.:format)          properties#destroy
#           new_tenant_session GET    /tenants/sign_in(.:format)         devise/sessions#new
#               tenant_session POST   /tenants/sign_in(.:format)         devise/sessions#create
#       destroy_tenant_session DELETE /tenants/sign_out(.:format)        devise/sessions#destroy
#              tenant_password POST   /tenants/password(.:format)        devise/passwords#create
#          new_tenant_password GET    /tenants/password/new(.:format)    devise/passwords#new
#         edit_tenant_password GET    /tenants/password/edit(.:format)   devise/passwords#edit
#                              PATCH  /tenants/password(.:format)        devise/passwords#update
#                              PUT    /tenants/password(.:format)        devise/passwords#update
#   cancel_tenant_registration GET    /tenants/cancel(.:format)          devise/registrations#cancel
#          tenant_registration POST   /tenants(.:format)                 devise/registrations#create
#      new_tenant_registration GET    /tenants/sign_up(.:format)         devise/registrations#new
#     edit_tenant_registration GET    /tenants/edit(.:format)            devise/registrations#edit
#                              PATCH  /tenants(.:format)                 devise/registrations#update
#                              PUT    /tenants(.:format)                 devise/registrations#update
#                              DELETE /tenants(.:format)                 devise/registrations#destroy
#         new_landlord_session GET    /landlords/sign_in(.:format)       devise/sessions#new
#             landlord_session POST   /landlords/sign_in(.:format)       devise/sessions#create
#     destroy_landlord_session DELETE /landlords/sign_out(.:format)      devise/sessions#destroy
#            landlord_password POST   /landlords/password(.:format)      devise/passwords#create
#        new_landlord_password GET    /landlords/password/new(.:format)  devise/passwords#new
#       edit_landlord_password GET    /landlords/password/edit(.:format) devise/passwords#edit
#                              PATCH  /landlords/password(.:format)      devise/passwords#update
#                              PUT    /landlords/password(.:format)      devise/passwords#update
# cancel_landlord_registration GET    /landlords/cancel(.:format)        devise/registrations#cancel
#        landlord_registration POST   /landlords(.:format)               devise/registrations#create
#    new_landlord_registration GET    /landlords/sign_up(.:format)       devise/registrations#new
#   edit_landlord_registration GET    /landlords/edit(.:format)          devise/registrations#edit
#                              PATCH  /landlords(.:format)               devise/registrations#update
#                              PUT    /landlords(.:format)               devise/registrations#update
#                              DELETE /landlords(.:format)               devise/registrations#destroy
#                        about GET    /about(.:format)                   pages#about
#                         root GET    /                                  pages#home
#

Rails.application.routes.draw do

  resources :properties

  devise_for :tenants
  devise_for :landlords

  get 'about' => 'pages#about'
  root 'pages#home'
end
