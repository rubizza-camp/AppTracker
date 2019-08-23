class Services::Parsers::Power < Services::Parsers::Base

  private

  def arguments
    ['content'][country].first['power']
  end
end
