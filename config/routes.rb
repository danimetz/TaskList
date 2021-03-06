Rails.application.routes.draw do
  root 'tasks#index' #root_path will take you to this page
  resources :tasks
  # get   '/tasks', to: 'tasks#index', as: 'tasks'
  # get   '/tasks/new', to: 'tasks#new', as: 'new_task'
  # post  '/tasks', to: 'tasks#create'
  #
  # get   '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  # get   '/tasks/:id', to: 'tasks#show', as: 'task'
  patch '/tasks/:id/complete', to: 'tasks#complete', as: 'complete_task'
  # patch '/tasks/:id', to: 'tasks#update'
  # delete '/tasks/:id', to: 'tasks#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
