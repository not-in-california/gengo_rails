Rails.application.routes.draw do
  resources :localizations do
    collection do
      post :import
    end
  end
end
