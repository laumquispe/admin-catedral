Rails.application.routes.draw do
  resources :cajamensuales
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
  get '/lastregistro', to:'cajagenerales#lastregistro'
  get '/sumregistros', to:'cajagenerales#sumregistros'
  put '/updatebyconcepto', to: 'subconceptos#updatebyconcepto'
  get '/getregistroscajabyrangomes', to:'cajagenerales#getregistroscajabyrangomes'
  get '/lastcierremensual', to:'cajamensuales#lastcierremensual'
  put '/updateregistroscajabymes', to: 'cajagenerales#updateregistroscajabymes'
  get '/getcajamensualbyperiodo', to: 'cajamensuales#getcajamensualbyperiodo'
  get '/getlastrecibointerno', to: 'cajagenerales#getlastrecibointerno'
  get '/getcajamensualbyanio', to: 'cajamensuales#getcajamensualbyanio'
  get '/agrupadosbysubconcepto', to: 'cajagenerales#agrupadosbysubconcepto'
  
end
