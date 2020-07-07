Rails.application.routes.draw do
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	root 'welcome#index'
	get '/signup' => 'signup#index'
	post '/signup/create' => 'signup#create'
	get '/signin' => 'signin#index'
	post '/signin/authenticate' => 'signin#signin'
	post '/inbox' => 'inbox#index'
	get '/inbox' => 'inbox#show'
	post '/inbox/assign' => 'inbox#assign'
	get '/inbox/assign' => 'inbox#assign'
	post '/emails/fetch' => 'emails#fetch'
	get '/emails/show' => 'emails#show'
	get '/emails/compose' => 'emails#compose'
	post '/emails/compose' => 'emails#helper'
	post '/emails/reply' => 'emails#reply'
end
