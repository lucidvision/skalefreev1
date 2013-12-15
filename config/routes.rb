Skalefreev1::Application.routes.draw do
  devise_for :users, skip: :registrations
  devise_scope :user do
    resource :registration,
    only: [:new, :create, :edit, :update],
    path: 'users',
    path_names: { new: 'sign_up' },
    controller: 'devise/registrations',
    as: :user_registration do
      get :cancel
    end
  end

  resources :users do
    member { post :vote }
    member { put :active }
  end

  resources :profile

  resources :findposts, only: [:create, :destroy] do
    collection do
      match '/search' => 'findposts#findyou', :via => [:get, :post], :as => :search
    end
  end

  resources :forumposts, only: [:create, :destroy] do
    collection do
      match '/search' => 'forumposts#forum', :via => [:get, :post], :as => :search
    end
    member { post :vote }
    resources :comments, only: [:create, :destroy]
  end

  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  root to: 'static_pages#home'
  match '/findyou', to: 'findposts#findyou'
  match '/findme', to: 'findposts#findme'
  match '/popup', to: 'findposts#popup'

  match '/wall', to: 'forumposts#forum'

  match '/help', to: 'static_pages#help'
  match '/wall/help', to: 'static_pages#wall_help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end