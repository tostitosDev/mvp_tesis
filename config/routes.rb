Rails.application.routes.draw do
  devise_for :users
  get 'reports/index'
  get 'marks/index'

  resources :employees
  resources :marks
  resources :reports, only: [:index]

  get 'dashboards/index'
  root 'dashboards#index'

  get 'reports/employees/:employee_id' => 'reports#show', :as => 'report_employees'

  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :marks
      resources :fingerprints
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end