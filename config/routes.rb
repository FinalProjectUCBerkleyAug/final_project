Rails.application.routes.draw do
  resources :pets
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#landing'
  resources :posts do
    resources :comments do
      :create
      collection do
        patch :destroy
      end
    end
    resources :likes
  end
  resources :users, only: :show
<<<<<<< HEAD

# Routes for Google authentication
#get ‘auth/:provider/callback’, to: ‘sessions#googleAuth’
#get ‘auth/failure’, to: redirect(‘/’)
=======
  resources :recommendations, only: [:index]
>>>>>>> 661590e36fee1144f3ab20d2991923a0956bfc62
end
