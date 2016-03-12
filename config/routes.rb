Rails.application.routes.draw do
  devise_for :mechanics, :controllers => {registrations: 'registrations'}

  get '/' => 'mechanics#home'

  resources :customers, except: [:show, :destroy]

  resources :mechanics, only: [:show] do 
    resources :jobs
  end

  post '/jobs' => 'jobs#create'
  post '/complete' => 'work_orders#complete'

  get '/auth/facebook/callback' => 'sessions#create'

  get '/get_jobs' => 'jobs#all_jobs'
  get '/mechanics/:id/get_jobs' => 'jobs#mechanic_jobs'

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
