class Services::Parsers::Ratings < Services::Parsers::Base
    %w(1 2 3 4 5 avg total).each_with_index do |type, index|
      define_method("rating_#{type}") { response[index][type] || ''}
    end
end
