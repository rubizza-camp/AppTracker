class Services::Parsers::Downloads < Services::Parsers::Base
  def parse
    super&.first&.fetch('downloads')
  end
  alias perform parse
end
