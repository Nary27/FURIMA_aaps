Rails.application.routes.draw do
  devise_for :users
  root to: 'items#top_page'

  resources :signups, only: [:index, :new,:create] do
    collection do
      get "tel"
      get "address"
      get "complete"
      get "credit_card"
      get "log_out"
      get "my_page"
      get "login"
    end
  end

  resources :cards, only: [:index, :new, :create, :show]

  resources :items, only: [:new, :show, :create, :edit, :update] do
    collection do
      get "get_category_children"
      get "get_category_grandchildren"
      get "cal_profit"
    end
    member do
      get "check"
      post "buycomp"
      get "sellcomp"
      get "delete"
      delete "item_destroy"
    end
  end
end
