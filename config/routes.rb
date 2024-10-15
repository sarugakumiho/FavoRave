Rails.application.routes.draw do
  # ------------------------------------------------------------------------------------------------------------------
  # 会員新規登録・ログイン設定
  devise_for :users, controllers: {
  registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # ------------------------------------------------------------------------------------------------------------------
  # 管理者ログイン設定
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  # ------------------------------------------------------------------------------------------------------------------
  # [Public側]
  # homesルーティング
  root to: 'homes#top'
  get 'homes/about'
  scope module: :public do
    # membersルーティング
    resources :members, only: [:show, :index] do
      collection do
        get '/my_page', to: 'members#my_page', as: 'my_page'
      end
      member do
        get 'check'
        delete 'destroy', to: 'members#destroy', as: 'destroy'
      end
      resources :posts, only: [:index, :show]
    end
    get '/members/information/edit', to: 'members#edit', as: 'edit_member_information'
    patch '/members/information', to: 'members#update', as: 'update_member_information'
    # postsルーティング
    resources :posts, only: [:create, :new, :show, :index, :edit, :update, :destroy] do
    # tag関係（一覧・検索）ルーティング
      collection do 
        get 'tags'
      end
    end
    get '/posts/tags/search', to: 'posts#tags_search', as: 'posts_tags_search'
  
  end
  # ------------------------------------------------------------------------------------------------------------------
  # [Admin側]
  # homesルーティング
  get 'admin', to: 'admin/homes#top'
  namespace :admin do
  end
  # ------------------------------------------------------------------------------------------------------------------
end