Rails.application.routes.draw do
  root "home#index"

  get 'stats/index'
  get 'stats/new'
  get 'stats/edit'
  get 'stats/show'
  get 'cohorts/index'
  get 'cohorts/new'
  get 'cohorts/edit'
  get 'cohorts/show'
  get 'courses/index'
  get 'courses/new'
  get 'courses/edit'
  get 'courses/show'
  get 'students/index'
  get 'students/new'
  get 'students/edit'
  get 'students/show'
  get 'employees/index'
  get 'employees/new'
  get 'employees/edit'
  get 'employees/show'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.

    
  resource :employees
  resource :students
  resource :classes
  resource :cohorts
  resource :stats

end
