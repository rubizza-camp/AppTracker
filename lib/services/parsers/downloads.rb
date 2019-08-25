class Services::Parsers::Downloads < Services::Parsers::Base

  private

  def parse
    super&.first
  end
  alias perform parse
end
