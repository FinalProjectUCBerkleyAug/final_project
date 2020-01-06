Rails.application.routes.draw do
  resources :pets
  devise_for :users, :controllers => {:registrations => "registrations"}
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

  resources :recommendations, only: [:index]
end
