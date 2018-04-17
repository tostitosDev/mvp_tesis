Rails.application.routes.draw do
  get 'reports/index'
  get 'marks/index'

  resources :employees
  resources :marks
  resources :reports
  get 'dashboards/index'
  root 'dashboards#index'

  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :marks
      resources :fingerprints
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end