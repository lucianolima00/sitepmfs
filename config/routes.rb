require 'carrierwave/orm/activerecord'

Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  get 'account/:id', to: 'account#index', as: 'account'
  get 'account/:id/new', to: 'account#new', as: 'account_new'
  get 'account/:id/edit', to: 'account#edit', as: 'account_edit'
  patch 'account/update'
  get 'account/:id/show', to: 'account#show', as:'account_show'
  get 'dashboard/dashboardAdmin'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_scope :user do 
    get 'users', to: 'users/registrations#index'
    patch 'users/:id', to: 'users/registrations#account_update', as: 'users_update'
    put 'account/:id/show', to: 'users/registrations#set_teacher', as: 'set_teacher'
    put 'account/:id/show', to: 'users/registrations#set_student', as: 'set_student'
  end
  resources :questionnaires
  get 'questionnaires/:id/write', to: 'questionnaires#write', as: 'questionnaire_write'
  resources :questions
  resources :subjects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
