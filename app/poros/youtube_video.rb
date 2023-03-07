class YoutubeVideo
  attr_reader :id,
              :title,
              :youtube_video_id

  def initialize(data)
    @id = nil
    @title = data[:snippet][:title]
    @youtube_video_id = data[:id][:videoId]
  end
end
