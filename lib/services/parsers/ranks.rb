class Services::Parsers::Ranks < Services::Parsers::Base
  attribute :shop_type

  private

  def parse
    binding.pry
    super&.fetch('ranks').fetch('ALL')
    binding.pry
  end
  alias perform parse

  def key
    binding.pry
    { android: 'ALL', ios: '0' }[shop_type.to_sym]
  end
end
