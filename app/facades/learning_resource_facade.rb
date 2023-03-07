class LearningResourceFacade
  def self.country(country)
    video = YoutubeFacade.get(country)
    images = ImageFacade.get(country)

    LearningResource.new(video, images, country)
  end
end
