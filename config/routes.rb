Rails.application.routes.draw do
  get 'home/index'
  resources :todos
  root 'todos#index'
  get 'todos/:id/trello_delete' => 'todos#trello_delete', as: :trello_delete
  get 'todos/:id/trello_done' => 'todos#trello_done', as: :trello_done

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
