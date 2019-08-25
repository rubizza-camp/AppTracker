class Services::Parsers::Downloads < Services::Parsers::Base

  private

  def parse
    { field_name => super&.first&.fetch(field_name, nil) }
  end
  alias perform parse
end
