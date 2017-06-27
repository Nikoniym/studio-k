Rails.application.routes.draw do


  get 'table_publishes/publish'
  get 'table_publishes/filter'
  get 'active_tables/filter'

  get 'persons/profile', as: 'user_root'
  get 'persons/edit_user'
  put 'persons/update_user'
  get 'persons/edit_avatar'
  patch 'persons/update_avatar'
  get 'persons/avatar'
  get 'persons/remove_message'

  get 'history/index'

  # resource :persons, except: [:index, :show, :edit, :destroy, :update, :new, :create]do
  #   get :profile, as: 'user_root'
  #   get :edit_user, on: :collection
  #   put :update_user, on: :collection
  #   get :edit_avatar, on: :collection
  #   patch :update_avatar, on: :collection
  #   post :crop, on: :member
  # end


  resources :albums do
    resources :images, only: [:index, :create, :destroy]
    get :load_gallery, on: :member
  end

  resources :active_tables do
    get :load_table, on: :collection
    get :entry_lesson, on: :member
    get :remove_lesson, on: :member
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  resources :teachers do
    get :destroy_lesson, on: :member
    get :active_lesson, on: :member
    get :add_no_registration, on: :member
    get :remove_no_registration, on: :member
    get :paid, on: :member
    get :delete_paid, on: :member
    resources :lessons, only: [:add_user, :remove_user] do
      get :add_user, on: :member
      get :remove_user, on: :member
    end
  end

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :subscriptions do
    get :confirm, on: :member
    get :select_tariff, on: :member
    get :paid, on: :member
    get :no_paid, on: :member
  end
  get 'home/index'
  root to: 'home#index'

  resources :families do
    resources :family_cashes, only: [:add_user, :remove_user] do
      get :add_user, on: :member
      get :remove_user, on: :member
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
