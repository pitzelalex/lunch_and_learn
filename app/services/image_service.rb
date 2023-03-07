class ImageService
  def self.get(query)
    response = conn.get('/search/photos') do |req|
      req.params['query'] = query
    end

    parse(response)
  end

  def self.conn
    Faraday.new(
      url: 'https://api.unsplash.com',
      params: {
        client_id: ENV['unsplash_access_key']
      },
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
