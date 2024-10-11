Rails.application.routes.draw do
  
  # トップ画面に遷移
  root to: 'homes#top'
  
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
