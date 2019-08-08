Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v0' do
      resources :packages
      namespace 'search' do
        resources :packages
      end
    end
  end
end
