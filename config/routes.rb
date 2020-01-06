Rails.application.routes.draw do
  root 'posts#landing'
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
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
  resources :pets do
    resources :favors
  end
  resources :users, only: :show

<<<<<<< HEAD
=======
# Routes for Google authentication
#get ‘auth/:provider/callback’, to: ‘sessions#googleAuth’
#get ‘auth/failure’, to: redirect(‘/’)
>>>>>>> 7342b28f8ef3675b9f66325f140087bf2d83d15e
  resources :recommendations, only: [:index]
end
