Rails.application.routes.draw do
  
  # トップページ
  root to: 'homes#top'
  # アバウトページ
  get 'homes/about'
  
  # deviseルーティング
  devise_for :admins
  devise_for :users
  
  # 会員ルーティング
  namespace :public do
    resources :users, only: [:show, :index, :edit, :update, :destroy] do
      collection do
        get 'my_page'
        get 'check'
        patch 'information', to: 'users#update'
      end
    end
  end
  
end