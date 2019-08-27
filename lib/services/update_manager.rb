class Services::UpdateManager < Services::Base
  attribute :term
  attribute :current_app

  def update_meta
    self.call(Services::Updaters::Metadata.call(term: term))
  end

  def perform
    Services::Updaters::Dynamic.call(current_app: current_app)
    # Services::Updaters::Ratings.call(current_app: current_app)
  end
end
