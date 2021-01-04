Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "students#index"
  resources :students
  post :line_events, to: 'line_events#receive'
  resources :ios
  resources :messages
end
