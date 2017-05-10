Rails.application.routes.draw do

  get '/' => 'pages#index'

  get '/dishes' => 'dishes#index'
  get 'dishes/new' => 'dishes#new'
  post '/dishes' => 'dishes#create'
  get '/dishes/:id' => 'dishes#show'
  get '/dishes/:id/edit' => 'dishes#edit'
  patch '/dishes/:id' => 'dishes#update'
  delete '/dishes/:id' => 'dishes#destroy'

	get '/signup' => 'users#new'
	post '/users' => 'users#create'

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	get '/logout' => 'sessions#destroy'

	post '/orders' => 'orders#create'
	get '/orders/:id' => 'orders#show'

	get '/carted_dishes' => 'carted_dishes#index'
	post '/carted_dishes' => 'carted_dishes#create'
	delete '/carted_dishes/:id' => 'carted_dishes#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
