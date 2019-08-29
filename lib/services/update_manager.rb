module Services
  class UpdateManager < Services::Base
    attribute :title
    attribute :app

    def perform
      fetch_app if title
      Services::Updaters::Dynamic.call(current_app: app)
      Services::Updaters::Ratings.call(current_app: app)
    end

    def fetch_app
      @app = App.find_by(term: title)
      @app = Services::Updaters::Metadata.call(term: title) if app.nil?
    end
  end
end
