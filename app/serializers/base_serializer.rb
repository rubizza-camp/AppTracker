class BaseSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel
  cache_options enabled: true, cache_length: 4.hours
end
