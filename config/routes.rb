Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

  resources :posts do
    resources :comments, except: [:index, :show] # NHO: doesnt look like you are using a destroy action either
  end

end
