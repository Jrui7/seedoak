Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"



 root :to => 'pages#home'
 require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end


  devise_for :users, :controllers => { :registrations => :registrations }
  resources :seeds, only: [:index, :new, :create, :update, :show], shallow: true do
    member do
      patch :update_delivery_costs
      put :update_delivery_costs
    end
    resources :picks, only: [:index, :edit, :show, :create, :update, :destroy] do
      member do
        patch :update_card
        put :update_card
      end
      resources :exchanges, only: [:create, :update]
      resources :payments, only: [:new, :create, :destroy]
    end
    resources :signal_seeds, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [ :show, :edit, :update] do
    member do
        patch :update_address
        put :update_address
        patch :update_paiement
        put :update_paiement
        patch :update_civil
        put :update_civil
      end
  end
  resources :addresses, only: [:create, :update]
  resources :campaigns, only: [:update]


  get 'signaled', to: 'campaigns#signaled'
  get 'pending', to: 'campaigns#pending'
  get 'success', to: 'campaigns#success'
  get 'fail', to: 'campaigns#fail'

  get 'message', to: 'campaigns#message'


  get 'admin', to: 'seeds#admin'
  get 'publish_seed', to: 'seeds#publish_seed'
  get 'newest', to: 'seeds#newest'
  get 'popular', to: 'seeds#popular'
  get 'last_day', to: 'seeds#last_day'

  get 'my_picks', to: 'picks#my_picks'
  get 'pick_history', to: 'picks#pick_history'

  get 'home', to: 'pages#home'
  get 'faq', to: 'pages#faq'
  get 'contact', to: 'pages#contact'
  get 'mentions_legales', to: 'pages#mentions_legales'
  get 'cgu', to: 'pages#cgu'


end

