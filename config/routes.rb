Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blogs, constraints: { id: /\d+/ }
  resources :blogs, constraints: { blog_id: /\d+/ } do
    resources :posts, constraints: { id: /\d+/ }
  end

  root 'blogs#index'
end
