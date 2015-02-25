Rails.application.routes.draw do
  resources :localizations do
    collection do
      post :import
      get :test_import
      post :update_job
    end
  end
end
