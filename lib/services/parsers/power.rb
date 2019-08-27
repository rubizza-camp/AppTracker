class Services::Parsers::Power < Services::Parsers::Base
  def parse
    super&.first&.fetch('power')
  end
  alias perform parse
end
