Feeds::Application.routes.draw do
  root :to => "posts#index"
  resources :subscriptions, :only => [:create]
  resources :posts, :only => [:index, :show]
end
