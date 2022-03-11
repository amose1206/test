Rails.application.routes.draw do
    root 'products#index'
    resources :products, only: [:show]
    resources :charges
end
