class Services::Updaters::Base < Services::Base
  private

  def update
  end
  alias perform update
end
