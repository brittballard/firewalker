Firewalker::Application.routes.draw do
  root to: 'searches#index'

  resources :searches, only: [:create, :index]
  get 'searches/:query' => 'searches#show'
end
