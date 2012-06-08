require 'api_constraints'

Friendscan::Application.routes.draw do

  match "/faq" => "home#faq"
  match "/terms" => "home#terms"
  namespace :api, defaults: {format: 'json'} do
    namespace :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resource :authentication , :controller => 'authentication'
      resource :user do
        member do
          get :qr_code
        end
      end
    end
  end



  scope "/(:locale)", :locale => /en|es/ do
    resources :cards

    match '/auth/:provider/callback' => 'sessions#create', :as => :auth_provider_callback
    match '/auth/failure' => 'sessions#failure'
    match "/sessions/signout" => "sessions#destroy", :as => :signout
  end

  
  match "/:locale" => "home#index" , :constraints => {:locale => /en|es/} , :as => :locale_home
  match '/(:locale)/:slug_id' => 'cards#show', :as => :card_landing,  :constraints => {:locale => /en|es/}
  root :to => "home#index"

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
  # match ':controller(/:action(/:id(.:format)))'
end

