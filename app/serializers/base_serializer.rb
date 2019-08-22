class BaseSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel
end
