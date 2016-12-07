Rails.application.routes.draw do


  root 'welcome#index'

  get '/auth/:provider/callback' => 'sessions#create_from_facebook'


  get 'sessions/new', as:'new_user_session'

  get 'users/new', as: 'new_user_registration'

  get 'users/create', as: 'create_new_user'

  get 'questionnaire_select/:id', to: 'questions#questionnaire_select', as: 'questionnaire_select'

  patch '/questions/:id/update_questionnaire', to: 'questions#update_questionnaire', as: 'update_questionnaire'

  delete '/questionnaires/:questionnaire_id/questions/:id', to: 'questions#destroy', as: 'destroy_question'

  post '/results/create', to: 'results#create', as: 'create_result'

  get '/questionnaires/:questionnaire_id/category/:id/show', to: 'category#show', as: 'display_category'

  patch '/questionnaires/:questionnaire_id/category/:id', to: 'category#record', as: 'record_category'

  get '/questionnaires/:questionnaire_id/results/:id/display', to: 'results#display', as: "questionnaire_result"

  get '/questionnaires/:questionnaire_id/results/:id', to: 'results#show', as: "result"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users

  resources :questionnaires do
    resources :questions, except: [:destroy]
    resources :results, except: [:create, :show]
  end

  get 'auth/:provider', to: 'sessions#create_from_facebook'

  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  post 'sessions/create', as: 'create_user_session'
  get '/auth/:provider/callback', to: 'sessions#create_from_facebook'

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
