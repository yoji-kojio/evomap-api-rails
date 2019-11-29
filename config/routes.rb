Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :careers
      resources :careers_users

      controller :careers do
        get '/careers/:id/get-career-contents' => :get_career_contents, as: :get_career_contents
      end

      controller :users do
        get '/users' => :index, as: :index
        get '/users/get-careers' => :get_careers, as: :get_careers
        get '/users/get-requirements' => :get_requirements, as: :get_requirements
        get '/users/get-finished-requirements' => :get_finished_requirements, as: :get_finished_requirements
      end
    end
  end
end
