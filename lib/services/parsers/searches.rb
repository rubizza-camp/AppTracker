class Services::Parsers::Searches < Services::Parsers::Base
  def parse
    { field_name => super.dig(field_name, key) }
  end
  alias perform parse

  def key
    { android: 'ALL', ios: '0' }[shop_type]
  end
  alias perform parse
end