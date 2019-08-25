class Services::Parsers::Base < Services::Base
  attribute :response
  attribute :country

  private

  def parse
    ::JSON.parse(response).dig(*path)
  end
  alias perform parse

  def field_name
    @field_name ||= self.class.name.demodulize.downcase
  end

  def path
    ['content', country].compact
  end
end
