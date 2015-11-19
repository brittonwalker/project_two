Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

# I like this, thanks for showing me.
  resources :posts do
    resources :comments, except: [:index, :show]
  end

end
