Rails.application.routes.draw do
  resources :comments, only:[:create, :update, :destroy, :show]

  resources :profiles, only:[:index, :show]

  resources :assignments

  resources :homeworks

  # NB - this is a convenient way to declare lots of routes with a similar pattern
  %i(home about help blogs repos).each do |action|
    get action, to: "static_pages##{action}", as: action
  end

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  root 'static_pages#home'
end
