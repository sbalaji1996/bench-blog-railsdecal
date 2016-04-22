Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  
  get "about", to: "pages#about"

  get "posts/newpost", to: "posts#new"

  post "posts", to: "posts#create"

  post "comments", to: "comments#create"

  get "comments/new", to: "comments#new"

  patch "like_post", to: "posts#like_post"

  patch "unlike_post", to: "posts#unlike_post"

  patch "like_comment", to: "comments#like_comment"

  patch "unlike_comment", to: "comments#unlike_comment"

  #resources :posts do
  	#resources :comments
  #end

  resources :users, :blogs, :posts

end
