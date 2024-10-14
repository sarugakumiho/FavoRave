Rails.application.routes.draw do
  
  # トップページ
  root to: 'homes#top'
  # アバウトページ
  get 'homes/about'
  
  # deviseルーティング
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users, controllers: {
  registrations: "public/registrations",
    sessions: 'public/sessions'
  }
end