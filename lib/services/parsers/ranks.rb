class Services::Parsers::Ranks < Services::Parsers::Base
  attribute :shop_type

  private
  
  def parse
    { field_name => super.dig(field_name, key) }
  end
  alias perform parse

  def key
    { android: 'ALL', ios: '0' }[shop_type]
  end
end
