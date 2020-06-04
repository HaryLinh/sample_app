Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/signup", to: "users#new"
    get "/login", to: "sesssions#new"
    post "/login", to: "sesssions#create"
    delete "/logout", to: "sesssions#destroy"
    resources :account_activations, only: :edit
    resources :password_resets, except: %i(index show destroy)
    resources :microposts, only: %i(create destroy)
    resources :relationships, only: %i(create destroy)
    resources :users do
      member do
        get "followers", to: "followers#index"
        get "following", to: "followings#index"
      end
    end
  end
end
