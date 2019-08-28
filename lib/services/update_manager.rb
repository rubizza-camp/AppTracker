module Services
  class UpdateManager < Services::Base
    attribute :term
    attribute :app

    def perform
      @app = Services::Updaters::Metadata.call(term: term) if term
      Services::Updaters::Dynamic.call(current_app: app)
      Services::Updaters::Ratings.call(current_app: app)
    end
  end
end
