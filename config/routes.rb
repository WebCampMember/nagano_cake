Rails.application.routes.draw do
# 顧客側のルーティング設定
  scope module: :public do
    root to: "homes#top"
    get 'homes/about' => 'homes#about', as: 'about'
    resources :items,only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    get 'customers/my_page' => 'customers#show'
    get 'customers/my_page/edit' => 'customers#edit'
    patch 'customers/my_page' => 'customers#update'
    get 'customers/my_page/confirm_withdraw' => 'customers#confirm_withdraw'
    patch 'customers/my_page/withdraw' => 'customers#withdraw'
    resources :orders,only: [:index, :create, :new, :show] do
      collection do
        get 'thanx'
        post 'confirm'
      end
    end

    resources :addresses,only: [:index, :create, :edit, :update, :destroy]
  end

# 管理者側のルーティング設定
  namespace :admin do
    root to: 'homes#top'
    resources :items,only: [:index, :create, :new, :edit, :show, :update]
    resources :customers,only: [:index, :edit, :show, :update]
    resources :orders,only: [:show]
    resources :genres,only: [:index, :create, :edit, :update]
  end

  # 顧客用ログイン
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用ログイン
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
