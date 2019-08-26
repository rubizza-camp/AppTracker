class Services::Parsers::Ranks < Services::Parsers::Base
  attribute :shop_type

  private

  def path
    super+['ranks', key]
  end
  alias perform parse

  def key
    { android: 'ALL', ios: '0' }[shop_type.to_sym]
  end
end
