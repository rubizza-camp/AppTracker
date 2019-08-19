class AppRatingsParser
  attr_reader :response
  def initialize(response:)
    @response = response
  end

  def self.parse(response)
    new(response).parse
  end

  def parse
    parse_ratings
  end

  private

  def parse_ratings
    ratings_by_android = JSON.parse(response[:by_android])['content']['ratings']
    ratings_by_apple = JSON.parse(response[:by_apple])['content']['ratings']
    { by_android: { ratings: ratings_by_android, shop_type: 'android', date_period: parse_date_period },
      by_apple: { ratings: ratings_by_apple, shop_type: 'apple', date_period: parse_date_period } }
  end

  def parse_date_period
    start_period = Date.parse(JSON.parse(response[:by_android])['content']['start_date'])
    end_date = Date.parse(JSON.parse(response[:by_android])['content']['end_date'])
    { start_period: start_period, end_date: end_date }
  end
end
