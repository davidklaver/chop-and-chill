Rails.application.routes.draw do

	get '/' => 'pages#index'

	get '/dishes' => 'dishes#index'
	get '/dish/:id' => 'dishes#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
