Rails.application.routes.draw do

  get '/' => 'pages#index'
  get '/pages' => 'pages#index'
  post '/pages/contact_form' => 'pages#contact_form'

  get '/dishes' => 'dishes#index'
  get 'dishes/new' => 'dishes#new'
  post '/dishes' => 'dishes#create'
  get '/dishes/:id' => 'dishes#show'
  get '/dishes/:id/edit' => 'dishes#edit'
  patch '/dishes/:id' => 'dishes#update'
  delete '/dishes/:id' => 'dishes#destroy'

  get '/categories' => 'categories#index'
  get '/categories/:id' => 'categories#show'
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	get '/logout' => 'sessions#destroy'

  get '/orders/new' => 'orders#new'
  get '/orders/delivery' => 'orders#delivery'
	post '/orders' => 'orders#create'
	get '/orders/:id' => 'orders#show'

	get '/carted_dishes' => 'carted_dishes#index'
	post '/carted_dishes' => 'carted_dishes#create'
	delete '/carted_dishes/:id' => 'carted_dishes#destroy'

  get '/toppings' => 'toppings#index'
  get '/salad_toppings' => 'salad_toppings#index'
  get 'salad_ingredients' => 'salad_ingredients#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
