Rails.application.routes.draw do
  
  # トップページ
  root to: 'homes#top'
  # アバウトページ
  get 'homes/about'
  
  # deviseルーティング
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end