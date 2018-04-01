Rails.application.routes.draw do
  get 'dashboards/index'
  root 'dashboards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
