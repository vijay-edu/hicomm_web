Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users 
  resources :projects 
  resources :conversations
  resources :messages
  resources :groups

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get 'welcome/home' => 'welcome#home', as: 'welcome'
  get 'groups/home' => 'groups#index'
  get 'groups/new' => 'groups#new'
  put 'projects/:id/join' => 'projects#join', as: 'join'
  put 'projects/:id/leave' => 'projects#leave', as: 'leave'
  get 'projects/:id/conversations/new' => 'conversations#new', as: 'new_convo'
  post 'projects/:id/conversations/' => 'conversations#create', as: 'create_new_convo'
  get  'projects/:id/conversations/:id' => 'conversations#show', as: 'view_convo'
  get  'projects/:id/conversations/:id/pick_users' => 'conversations#pick_users', as: 'pick_convo_users'
  put  'projects/:id/conversations/:id/add_users/' => 'conversations#add_users', as: 'add_convo_users'

  get  'projects/:id/pick_users' => 'projects#pick_users', as: 'pick_project_users'
  put  'projects/:id/add_users/' => 'projects#add_users', as: 'add_project_users'

  post 'messages/create' => 'messages#create', as: 'post_new_message'

  get 'search' => 'welcome#search', as: 'search'

  get 'users/:id/manage' => 'users#manage', as: 'manage_user'

  get 'projects/:id/manage' => 'projects#manage_members', as: 'manage_project'
  get 'projects/:id/remove_members' => 'projects#remove_members', as: 'remove_project_members'
  put 'projects/:id/remove' => 'projects#remove_member', as: 'remove_project_member'
  get 'projects/:id/transfer_leadership' => 'projects#transfer_leadership', as: 'transfer_project_leadership'
  put 'projects/:id/new_leader' => 'projects#new_leader', as: 'new_leader'
  

  #put  'projects/:id/conversations/:id' => 'conversations#update', as: 'update_convo'

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
