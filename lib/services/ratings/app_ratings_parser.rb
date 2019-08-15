class AppRatingsParser
  attr_reader :response
  def initialize(response)
    @response = response
  end

  def self.parse(response)
    new(response).parse
  end

  def parse
    parse_response
  end

  private

  def parse_response
    { ratings: parse_ratings, date_period: parse_date_period }
  end

  def parse_ratings
    JSON.parse(response)['content']['ratings']
  end

  def parse_date_period
    Date.parse(JSON.parse(response)['content']['start_date'])
  end
end
