class ImageFacade
  def self.get(query)
    details = Rails.cache.fetch("image_query-#{query}", expires_in: 12.hours) do
      ImageService.get(query)
    end

    details[:results].map do |image|
      Image.new(image)
    end
  end
end
