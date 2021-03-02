Rails.application.routes.draw do
  get 'login',              to: 'user#login',              as: 'user_login'
  get 'signup',             to: 'user#signup',             as: 'user_signup'
  post 'authenticate',      to: 'user#authenticate',       as: 'user_authenticate'
  get 'save_user_details',  to: 'user#save_user_details',  as: 'save_user_details'
  get 'logout',             to: 'user#logout',             as: 'user_logout'
  get 'products',           to: 'user#products',           as: 'user_products'
  post 'add_to_cart/',      to: 'user#add_to_cart',        as: 'user_add_to_cart'
  scope '/cart' do
    get '/',               to: 'cart#index',              as: 'cart_index'
    patch '/update_cart',  to: 'cart#update_cart',        as: 'cart_update'
    get '/checkout',       to: 'cart#checkout',           as: 'cart_checkout'
    post '/finalise',      to: 'cart#finalise',           as: 'cart_finalise'
    get '/order_confirmation', to: 'cart#order_confirmation', as: 'order_confirmation'
  end
  root 'user#login'
  scope '/admin' do
    get '/',                to: 'products#index',           as: 'admin_index'
    get 'login',            to: 'admin#login',              as: 'admin_login'
    post 'authenticate',    to: 'admin#authenticate',       as: 'admin_authenticate'
    get 'logout',           to: 'admin#logout',             as: 'admin_logout' 
    resources :products
    delete 'delete_all_products', to: 'products#delete_all', as: 'product_delete_all'
  end
end
