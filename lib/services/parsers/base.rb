class Services::Parsers::Base < Services::Base
  attribute :apptweak_response

  private

  def parse
    { field_name => ::JSON.parse(apptweak_response).dig('content') }
  end
  alias perform parse

  def field_name
    class.name.demodulize.downcase
  end
end
