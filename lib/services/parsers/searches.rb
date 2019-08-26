class Services::Parsers::Searches < Services::Parsers::Base
  attribute :shop_type

  private

  def parse
    { shop_type => super&.first&.fetch('id') }
  end
  alias perform parse
end
