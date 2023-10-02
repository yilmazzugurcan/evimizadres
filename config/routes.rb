Rails.application.routes.draw do
  root 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :citizens, only: [:new, :create, :index]
  resources :devices, only: [:new, :create]

  # Eğer sessions kaynağını kullanmak isterseniz, aşağıdaki satırı ekleyebilirsiniz.
  # resources :sessions, only: [:new, :create, :destroy]
end
