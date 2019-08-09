class PackageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :company_name, :review_count, :average_rating, :downloads_count
end
