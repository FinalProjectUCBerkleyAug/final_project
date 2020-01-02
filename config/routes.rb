Rails.application.routes.draw do
  root 'posts#landing'
  resources :pets do
    member do
      post 'like'
    end
  end
  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments do
      :create
      collection do
        patch :destroy
      end
    end
    member do
      post 'like'
    end
  end
  resources :users, only: :show

# Routes for Google authentication
#get ‘auth/:provider/callback’, to: ‘sessions#googleAuth’
#get ‘auth/failure’, to: redirect(‘/’)
  resources :recommendations, only: [:index]
end
