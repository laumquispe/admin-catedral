Rails.application.routes.draw do
  resources :templates
  resources :ctacteproveedores
  resources :cajagenerales
  resources :subconceptos
  resources :conceptos
  resources :tiporegistros
  resources :tipocomprobantes
  resources :formapagos
  resources :proveedores
  resources :tipousuario_subpermisos
  resources :tipousuario_permisos
  resources :subpermisos
  resources :permisos
  mount_devise_token_auth_for 'Usuario', at: 'auth'
  resources :tipousuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/getconceptobytiporegistro', to: 'conceptos#getconceptobytiporegistro'
  get '/getsubconceptobyconcepto', to: 'subconceptos#getsubconceptobyconcepto'
  get '/getregistroscajabyRangofecha', to: 'cajagenerales#getregistroscajabyRangofecha'
  put '/updateregistrocanceled', to:'cajagenerales#updateregistrocanceled'
end
