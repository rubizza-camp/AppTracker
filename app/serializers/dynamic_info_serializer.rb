class DynamicInfoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :country, :date, :rank, :power,
             :downloads, :shop_type, :device, :app_id
end
