class YoutubeFacade
  def self.get(query)
    details = Rails.cache.fetch("youtube_query-#{query}", expires_in: 12.hours) do
      YoutubeService.get(query)
    end

    if details[:items].count > 0
      Video.new(details[:items].first)
    else
      {}
    end
  end
end
