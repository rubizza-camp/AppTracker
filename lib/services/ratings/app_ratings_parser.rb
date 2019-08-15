class AppRatingsParser < AppMothership
  attr_reader :response
  def initialize(response)
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
    JSON.parse(response)['content']['ratings']
  end
end
