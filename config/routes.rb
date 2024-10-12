Rails.application.routes.draw do
  
  # トップページ
  root to: 'homes#top'
  # アバウトページ
  get 'homes/about'
  
  # deviseルーティング
  devise_for :admins
  devise_for :users
  
  # 会員側
  namespace :public do
    # ユーザールーテイング
    resources :users, only: [:show, :index, :edit, :update, :destroy] do
      collection do
        get 'my_page'
        get 'check'
        patch 'information', to: 'users#update'
      end
    end
    # 投稿ルーティング
    resources :posts do
      collection do
        get 'tags'
        get 'tags_search', to: 'posts#tags_search'
      end
    end
  end
  
end