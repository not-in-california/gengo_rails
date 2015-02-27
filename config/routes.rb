Rails.application.routes.draw do
  scope "/gengo" do
    resources :localizations do
      collection do
        post :import
        get :test_import
        post :update_job
        post :send_to_gengo
      end
    end
  end
end
