Rails.application.routes.draw do

  resources :dados

  root 'dados#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'achados' => 'dados#achados', as: :achados
  get 'perdidos' => 'dados#perdidos', as: :perdidos
  get 'login' => 'pessoa#login', as: :login

end
