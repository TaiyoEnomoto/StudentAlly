Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'posts/dentsu' => 'posts#dentsu'
  get 'posts/toritsu' => 'posts#toritsu'
  get 'posts/yokokoku' => 'posts#yokokoku'
  get 'posts/noko' => 'posts#noko'
  get 'posts/chiba' => 'posts#chiba'
  get 'posts/gaigodai' => 'posts#gaigodai'
  get 'posts/kaiyodai' => 'posts#kaiyodai'
  get 'posts/yokoichi' => 'posts#yokoichi'


  resources :users, only: [:show] #ユーザーマイページへのルーティング
  
  resources :posts do
    resources :plays, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  
  

  root 'posts#index'
end
