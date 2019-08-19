class AppDynamicParser
  attr_reader :parsed_response
  def initialize(response:)
    @parsed_response = JSON.parse(response)
  end

  def self.dynamic_parse(response)
    new(response).dynamic_parse
  end

  def dynamic_parse
    return_parsed
  end

  private

  def return_parsed
    { by_apple: { ranks: parse_ranks_by_apple, shop_type: 'apple', device: 'iPhone' }.merge(parse_infos),
      by_android: { ranks: parse_ranks_by_android, shop_type: 'android', device: '' }.merge(parse_infos) }
  end

  def parse_infos
    { power: parse_power, downloads: parse_downloads, date_period: parse_date_period }
  end

  def parse_ranks_by_apple
    parsed_response[:ranks]['content']['ranks']['0']
  end

  def parse_ranks_by_android
    parsed_response[:ranks]['content']['ranks']['ALL']
  end

  def parse_power
    parsed_response[:power]['content'][response[:country]].first['power']
  end

  def parse_downloads
    if parsed_response[:downloads]['content'][response[:country]]
      parsed_response[:downloads]['content'][response[:country]].first['downloads']
    else
      ''
    end
  end

  def parse_date_period
    { start_date: Date.parse(parsed_response[:ranks]['content']['start_date']),
      end_date: Date.parse(parsed_response[:ranks]['content']['end_date']) }
  end
end
