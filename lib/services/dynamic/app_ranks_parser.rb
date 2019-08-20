class AppRanksParser
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
    else
      # Place for error message
    end
  end

  private

  def parse_ranks_by_apple
    JSON.parse(response)['content']['ranks']['0']
  end

  def parse_ranks_by_android
    JSON.parse(response)['content']['ranks']['ALL']
  end
end