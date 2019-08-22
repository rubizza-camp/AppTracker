class AppRatingsParser
  attr_reader :response
  def initialize(response)
    @response = response
  end

  def self.call(response)
    new(response).call
  end

  def call
    parse_ratings
  end

  private

  def parse_ratings
    if parsed_response == JSON.parse(response)
      parsed_response['content']['ratings']
    else
      ''
    end
  end
end
