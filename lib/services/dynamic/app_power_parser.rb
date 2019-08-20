class AppPowerParser
  attr_reader :response, :country
  def initialize(response, country)
    @response = response
    @country = country
  end

  def self.call(response, country)
    new(response, country).call
  end

  def call
    parse_power
  end

  private

  def parse_power
    if parsed_response = JSON.parse(response)['content'][country]
      parsed_response.first['power']
    else
      ''
    end
  end
end
