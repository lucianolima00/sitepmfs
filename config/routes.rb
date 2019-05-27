require 'carrierwave/orm/activerecord'

Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  resources :answers, :only => [:index]
  post 'questionnaire/:id/:student_id', to: 'questionnaires#answer', as: 'answer_create'
  get 'account/:id', to: 'account#index', as: 'account'
  get 'account/:id/new', to: 'account#new', as: 'account_new'
  patch 'account/:id/new', to: 'account#create', as: 'account_create'
  get 'account/:id/edit', to: 'account#edit', as: 'account_edit'
  patch 'account/:id/edit', to: 'account#update', as: 'account_update'
  get 'account/:id/show', to: 'account#show', as:'account_show'
  get 'dashboard/dashboardAdmin'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_scope :user do 
    get 'users', to: 'users/registrations#index'
    patch 'users/:id', to: 'users/registrations#account_update', as: 'users_update'
    put 'account/:id/show', to: 'users/registrations#set_teacher', as: 'set_teacher'
    put 'account/:id/show', to: 'users/registrations#set_student', as: 'set_student'
    put 'account/:id/show', to: 'users/registrations#set_admin', as: 'set_admin'
  end
  resources :questionnaires
  get 'questionnaires/:id/write', to: 'questionnaires#write', as: 'questionnaire_write'
  resources :questions
  resources :subjects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
