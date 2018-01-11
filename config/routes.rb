Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  defaults format: :json do
    get "/auth/github/callback", to: "sessions#create"
    delete "signout", to: "sessions#destroy"
  end
end
