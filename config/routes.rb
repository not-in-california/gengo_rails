Rails.application.routes.draw do
  scope "/gengo" do
    resources :localizations do
      collection do
        post :import
        get :test_import
      end
    end
  end
end
