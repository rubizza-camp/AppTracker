class Services::Parsers::Rankings < Services::Parsers::Base
  attr_reader :response, :shop_type
  def initialize(response, shop_type)
    @response = response
    @shop_type = shop_type
  end

  def self.call(response, shop_type)
    new(response, shop_type).call
  end

  def call
    if shop_type == 'android'
      parse_ranks_by_android
    elsif shop_type == 'ios'
      parse_ranks_by_apple
    end
  end

  private

  def parse_ranks_by_apple
    return '' if (parsed_response = JSON.parse(response)).nil?

    parsed_response['content']['ranks']['0']
  end

  def parse_ranks_by_android
    if parsed_response = JSON.parse(response)
      JSON.parse(parsed_response).dig('content', 'ranks', 'ALL')
    else
      ''
    end
  end
end
