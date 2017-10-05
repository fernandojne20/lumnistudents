Rails.application.routes.draw do
  resources :note_subjects
  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'subjects#index'
  resources :subjects
  resources :note_subjects
end
