class Services::Parsers::Power < Services::Parsers::Base

  private

  def parse
    super&.first
  end
  alias perform parse
end
