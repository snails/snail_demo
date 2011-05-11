SnailDemo::Application.routes.draw do


  #Configed by the kindeditor
  get 'kindeditor/images_list'
  post 'kindeditor/upload'
  #用户兴趣爱好映射
  match 'users/:id/faq/edit' => 'faq#edit'

  #用户联系方式映射
  match 'users/:id/contact/edit' => 'contact#edit'

  #用户基本资料映射
  match 'users/:id/spec/edit' => 'spec#edit'

  #用户配置文件映射
  #match 'users/:id/profile' => 'profile#show'

  #devise默认映射
  devise_for :users

  #设置自定义的登录、注销路径
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
    get '/signup' => 'devise/registrations#new'
  end    

    resources :users do
      resources :profile, :only => ['index']
      #resources :faq
      #resources :spec
      resources :albums do
        resources :photos
      end
      resources :posts
      resources :comments
   end

  #设置根路径
  root :to => 'pages#home'

  #设置关于我们映射
  match '/about' => "pages#about"

  #帮助路径映射
  match '/help' => "pages#help"

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
