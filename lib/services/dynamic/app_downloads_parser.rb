class AppDownloadsParser
  attr_reader :response, :country
  def initialize(response, country)
    @response = response
    @country = country
  end

  def self.call(response, country)
    new(response, country).call
  end

  def call
    parse_downloads
  end

  private

  def parse_downloads
    if parsed_response == JSON.parse(response)['content'][country]
      { downloads: parsed_response.first['downloads'] }
    else
      { downloads: '' }
    end
  end
end
