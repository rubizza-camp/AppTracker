module Services
  class UpdateManager < Services::Base
    attribute :title
    attribute :app

    def perform
      app_search
      @app = Services::Updaters::Metadata.call(term: title) if app.nil?
      Services::Updaters::Dynamic.call(current_app: app)
      Services::Updaters::Ratings.call(current_app: app)
    end

    def app_search
      @app = App.find_by(term: title)
    end
  end
end
