class AppDynamicParser
  def self.dynamic_parse
    new.dynamic_parse
  end

  def dynamic_parse
    return_parsed
  end

  private

  def return_parsed
    { ranks: parse_ranks, power: parse_power, downloads: parse_downloads }
  end

  def parse_ranks
    # JSON.parse(a)['content']['country']
    JSON.parse(a)['content']['ranks']['ALL']
  end

  def parse_power
    JSON.parse(a)['content'][country].first['power']
  end

  def parse_downloads
    JSON.parse(a)['content'][country].first['downloads']
  end
end
