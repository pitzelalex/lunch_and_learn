class ImageFacade
  def self.get(query)
    details = Rails.cache.fetch("image_query-#{query}", expires_in: 12.hours) do
      ImageService.get(query)
    end

    if details[:results].count > 0
      details[:results].map do |image|
        Image.new(image)
      end
    else
      []
    end
  end
end
