Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v0' do
      resources :packages, only: :index
    end
  end

  namespace 'api' do
    namespace 'v1' do
      resources :apps, only: %i[index show] do
        resources :users, only: [:create]
      end
    end
  end

  get '/:token/confirm_email/', :to => "users#confirm_email", as: 'confirm_email'
end
