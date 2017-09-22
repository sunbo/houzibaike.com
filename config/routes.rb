Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users

	resources :exposes do
		put :publish, on: :member
		put :unpublish, on: :member
	end

	resources :taos do
		get :list, on: :collection
		put :publish, on: :member
		put :unpublish, on: :member
	end

	resources :tao_categories do
		put :publish, on: :member
		put :unpublish, on: :member
	end

	resources :kus do
		get :list, on: :collection
		put :publish, on: :member
		put :unpublish, on: :member
	end

	resources :ku_categories do
		put :publish, on: :member
		put :unpublish, on: :member
	end

	resources :pics do
		member do
			put "like", to: "pics#upvote"
			put "dislike", to: "pics#downvote"
			put :publish
			put :unpublish
		end
		get :list, on: :collection
	end
end
