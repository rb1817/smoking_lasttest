Rails.application.routes.draw do

  root 'home#index'
  resources :notices
  resources :qnas
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get '/users/auth/kakao', to: 'users/omniauth_callbacks#kakao'
    get '/users/auth/kakao/callback', to: 'users/omniauth_callbacks#kakao_auth'
  end
  get 'user/index'

  get '/products/index_penalty'   => 'products#index_penalty'
  get '/products/new_penalty'     => 'products#new_penalty'
  resources :products
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/product_new'  => 'products#new_map'
  post '/product_map' => 'products#create_map'
    
  get '/smovesmoveadmin'                     => 'admin_pages#index'
  get '/smovesmoveadmin/show_user'           => 'admin_pages#show_user'
  get '/smovesmoveadmin/show_nsmoking'       => 'admin_pages#show_nsmoking'
  get '/smovesmoveadmin/show_smoke_place'    => 'admin_pages#show_smoke_place'
  get '/smovesmoveadmin/show_qna'            => 'admin_pages#show_qna'
  get '/smovesmoveadmin/show_notice'         => 'admin_pages#show_notice'
  get '/smovesmoveadmin/show_penalty_place'  => 'admin_pages#show_penalty_place'
  get '/smovesmoveadmin/nsmoking_areas'      => 'admin_pages#nsmoking_areas'
  get '/smovesmoveadmin/login'               => 'admin_pages#login'
  get '/smovesmoveadmin/new_notice'          => 'admin_pages#new_notice'  
    
  get '/smovesmoveadmin/edit_notice'          => 'admin_pages#edit_notice'  

  get '/likes/:product_id/home' => 'home#like_product'
  get '/likes/:product_id/product' => 'products#like_product'
  
    
end
