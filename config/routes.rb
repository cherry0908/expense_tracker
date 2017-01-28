Rails.application.routes.draw do
  root 'welcome#index'
  
  devise_for :admin_users
  devise_for :users
  resources :expenses
  resources :admin_user_expenses

  get 'admin_user_reports', to: 'admin_user_reports#index'
  get 'reports', to: 'reports#index'
  get 'other_expenses', to: 'admin_user_expenses#other_expenses'

end
