Rails.application.routes.draw do
  
  root to: 'home#index'

  namespace :admin do
  end
  mount API => '/api'

end
