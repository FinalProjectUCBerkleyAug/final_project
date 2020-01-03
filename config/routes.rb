Rails.application.routes.draw do
  root 'posts#landing'
  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments do
      :create
      collection do
        patch :destroy
      end
    end
    resources :likes
  end
  resources :pets
  resources :users, only: :show

# Routes for Google authentication
#get ‘auth/:provider/callback’, to: ‘sessions#googleAuth’
#get ‘auth/failure’, to: redirect(‘/’)
  resources :recommendations, only: [:index]
end
