class Services::UpdateManager < Services::Base
  attribute :term
  attribute :current_app

  def perform
    @current_app = Services::Updaters::Metadata.call(term: term) if term
    Services::Updaters::Dynamic.call(current_app: current_app)
    Services::Updaters::Ratings.call(current_app: current_app)
  end
end
