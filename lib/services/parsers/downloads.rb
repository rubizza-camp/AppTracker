class Services::Parsers::Downloads < Services::Parsers::Base
  def arguments
    ('content', country).first['downloads']
  end
end
