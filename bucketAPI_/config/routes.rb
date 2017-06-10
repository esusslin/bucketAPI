Rails.application.routes.draw do


  resources :notifications
post 'props/url', to: 'props#url'
  resources :props
  resources :users
	  resources :proposals



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
