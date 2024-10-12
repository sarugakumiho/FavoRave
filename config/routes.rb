Rails.application.routes.draw do
  
  # トップページ
  root to: 'homes#top'
  # アバウトページ
  get 'homes/about'
  
  # deviseルーティング
  devise_for :admins
  devise_for :users  
end