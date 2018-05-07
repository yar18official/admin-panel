Rails.application.routes.draw do
  root "home#index"

  get 'stats/index'
  
  resources :employees do
      member do
          get :delete
      end
  end

  resources :students do
      member do
          get :delete
      end
  end

  resources :courses do
      member do
          get :delete
      end
  end

  resources :cohorts do
      member do
          get :delete
      end
  end

end
