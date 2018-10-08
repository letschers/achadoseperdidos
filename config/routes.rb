Rails.application.routes.draw do

  resources :dados do 

  	member do 

  		get 'archive'
  	end

  end

  root 'dados#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'achados' => 'dados#achados', as: :achados
  get 'perdidos' => 'dados#perdidos', as: :perdidos
  get 'arquivados' => 'dados#arquivados', as: :arquivados

  get 'login' => 'pessoas#login', as: :login
  get 'logout' => 'pessoas#logout', as: :logout
  post 'autenticacao' => 'pessoas#authenticate', as: :autenticacao


end
