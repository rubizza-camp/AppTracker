Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v0' do
      resources :packages, only: :index
    end
  end

  namespace 'api' do
    namespace 'v1' do
      resources :apps, param: :title, only: %i[index show] do
        resources :subscribers
      end
    end
  end
end
