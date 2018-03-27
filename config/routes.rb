Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/logout' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blogs
  root 'blogs#index'
end
