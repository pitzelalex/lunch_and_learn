class RecipeSerializer
  include JSONAPI::Serializer
  attributes :title,
             :url,
             :country,
             :image,
             :id
end
