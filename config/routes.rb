Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v0' do
      resources :packages, only: :index
    end
  end

  namespace 'api' do
    namespace 'v1' do
      resources :apps, only: %i[index show create] do
        resources :users, only: [:create]
      end
    end
  end
end
