class Services::Parsers::Searches < Services::Parsers::Base

  private

  def parse
    super&.first&.fetch('id')
  end
  alias perform parse
end
