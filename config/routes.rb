Rails.application.routes.draw do
# 会員側のルーティング設定
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'
  scope module: :public do
    resources :items,only: [:index, :show]
  end
  
  namespace :admin do
    resources :items,only: [:new, :index, :show, :edit, :update, :destroy]
  end

  # 顧客用ログイン
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
