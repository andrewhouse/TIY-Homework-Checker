Rails.application.routes.draw do
  resources :assignments

  get 'incomplete', to: 'homeworks#incomplete', as: :incomplete
  get 'complete', to: 'homeworks#complete', as: :complete
  get 'mine', to: 'homeworks#mine', as: :mine

  resources :homeworks

  # NB - this is a convenient way to declare lots of routes with a similar pattern
  %i(home about help blogs repos profile).each do |action|
    get action, to: "static_pages##{action}", as: action
  end

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  root 'static_pages#home'
end
