class AppDynamicParser
  attr_reader :response
  def initialize
    @response = response
  end

  def self.dynamic_parse_by_andriod(response)
    new(response).dynamic_parse_by_andriod
  end

  def dynamic_parse_by_andriod
    return_parsed_by_android
  end

  def self.dynamic_parse_by_apple(response)
    new(response).dynamic_parse_by_apple
  end

  def dynamic_parse_by_apple
    return_parsed_by_apple
  end

  private

  def return_parsed_by_apple
    { ranks: parse_ranks_by_apple, power: parse_power, downloads: parse_downloads, date_period: parse_date_period }
  end

  def return_parsed_by_android
    { ranks: parse_ranks_by_android, power: parse_power, downloads: parse_downloads, date_period: parse_date_period }
  end

  def parse_ranks_by_apple
    JSON.parse(response[:ranks])['content']['ranks']['0']
  end

  def parse_ranks_by_android
    JSON.parse(response[:ranks])['content']['ranks']['ALL']
  end

  def parse_power
    JSON.parse(response[:power])['content'][country].first['power']
  end

  def parse_downloads
    JSON.parse(response[:downloads])['content'][country].first['downloads']
  end

  def parse_date_period
    { start_date: Date.parse(JSON.parse(response[:ranks])['content']['start_date']),
      end_date: Date.parse(JSON.parse(response[:ranks])['content']['end_date']) }
  end
end
