Rails.application.routes.draw do
  resources :questions
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  resources :questionnaires
  get 'questionnaires/:id/write' => 'questionnaires#write'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
