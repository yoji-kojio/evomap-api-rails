Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :careers
      resources :careers_users

      controller :careers do
        get '/careers/:id/get_career_contents' => :get_career_contents, as: :get_career_contents
      end
    end
  end
end
