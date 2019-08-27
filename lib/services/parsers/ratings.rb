class Services::Parsers::Ratings < Services::Parsers::Base
  def path
    super+['ratings']
  end
end
