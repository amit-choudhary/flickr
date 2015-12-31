Rails.application.routes.draw do

  resources :persons, only: [] do
    get :photos
    resources :friends, only: [] do
      collection do
        get :photos
      end
    end
  end

  root 'home#index'
end
