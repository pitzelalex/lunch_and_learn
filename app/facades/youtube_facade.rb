class YoutubeFacade
  def self.get(query)
    details = Rails.cache.fetch("youtube_query-#{query}", expires_in: 12.hours) do
      YoutubeService.get(query)
    end

    YoutubeVideo.new(details[:items].first)
  end
end
