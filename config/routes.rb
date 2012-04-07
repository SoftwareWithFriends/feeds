Feeds::Application.routes.draw do
  root :to => "posts#index"
  resources :subscriptions, :only => [:create, :index] do 
    resources :posts, :only => [:index, :show]
  end
end
