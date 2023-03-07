class YoutubeService
  def self.get(query)
    response = conn.get('/youtube/v3/search') do |req|
      req.params['q'] = query
    end

    parse(response)
  end

  def self.conn
    Faraday.new(
      url: 'https://youtube.googleapis.com',
      params: {
        channelId: 'UCluQ5yInbeAkkeCndNnUhpw',
        key: ENV['youtube_api_key'],
        part: 'snippet',
        maxResults: '5',
        type: 'video'
      },
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
