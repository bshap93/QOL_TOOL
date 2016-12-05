Rails.application.routes.draw do

  root 'welcome#index'

  get 'sessions/new', as:'new_user_session'

  get 'users/new', as: 'new_user_registration'

  get 'users/create', as: 'create_new_user'

  post 'sessions/create', as: 'create_user_session'

  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'questionnaire_select/:id', to: 'questions#questionnaire_select', as: 'questionnaire_select'

  patch '/questions/:id/update_questionnaire', to: 'questions#update_questionnaire', as: 'update_questionnaire'

  delete '/questionnaires/:questionnaire_id/questions/:id', to: 'questions#destroy', as: 'destroy_question'

  post '/results/create', to: 'results#create', as: 'create_result'

  resources :users, except: [:index]

  resources :questionnaires do
    resources :questions, except: [:destroy]
    resources :results, except: [:create]
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
