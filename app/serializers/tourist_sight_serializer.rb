class TouristSightSerializer
  include JSONAPI::Serializer
  attributes :id,
             :name,
             :address,
             :place_id
end
