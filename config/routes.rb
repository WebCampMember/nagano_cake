Rails.application.routes.draw do
# 会員側のルーティング設定
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'
  resources :items
  devise_for :customers

# 管理者側のルーティング設定
  namespace :admin do
    resources :items
  end
  devise_for :admins

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
