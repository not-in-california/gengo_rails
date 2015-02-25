Rails.application.routes.draw do
<<<<<<< HEAD
  scope "/gengo" do
    resources :localizations do
      collection do
        post :import
        get :test_import
      end
=======
  resources :localizations do
    collection do
      post :import
      get :test_import
      post :update_job
>>>>>>> Process gengo callback package.
    end
  end
end
