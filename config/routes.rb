Rails.application.routes.draw do
  namespace :api do
    resource :user, only: [:show, :create, :update]

    resources :beacons, only: [:index, :show, :update], param: :major_minor do
      resources :activations, only: [:create]
    end
  end

  namespace :admin do
    resources :beacons
  end
end
