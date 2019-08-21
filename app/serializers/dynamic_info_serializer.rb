class DynamicInfoSerializer < BaseSerializer
  attributes :country, :date, :rank, :power,
             :downloads, :shop_type, :device, :app_id

  belongs_to :app
end
