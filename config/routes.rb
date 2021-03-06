Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admin, controllers: {
  sessions: 'admin/sessions'
}
  
  namespace :admin do
    resources :users, only:[:index, :show, :edit, :update]
    get '/users/:id/order' => 'users#recipe', as: 'user_recipes'
    resources :recipes, only:[:index, :show] do
      resources :recipe_comments, only:[:destroy]
    end
  end
  
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  get 'search' => 'searches#search'
  
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :recipes do
    resource :favorites, only:[:create, :destroy]
    resources :recipe_comments, only:[:create, :destroy]
  end
  
  resources :users, only:[:index, :show, :edit, :update] do
    member do
      get :favorites
    end
  end
  get 'users/:id/quit' => 'users#quit', as: 'quit'
  patch 'users/:id/out' => 'users#out', as: 'out'
  
end
