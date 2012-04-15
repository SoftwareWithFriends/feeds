Feeds::Application.routes.draw do
  devise_for :users, :path => "accounts"

  resources :users do
    resources :favorites
  end

  root :to => "posts#index"
  resources :subscriptions, :only => [:create, :index, :show] do 
    resources :posts, :only => [:index, :show]
  end
  resources :posts, :only => [:index, :show]
  resources :topics, :only => [:create, :show]
end
