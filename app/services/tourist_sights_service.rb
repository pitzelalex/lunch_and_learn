class TouristSightsService
  def self.get(lat_long)
    response = conn.get('/v2/places') do |req|
      req.params = params(lat_long)
    end

    parse(response)
  end

  def self.conn
    Faraday.new('https://api.geoapify.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.params(lat_long)
    {
      apiKey: ENV['places_api_key'],
      categories: 'tourism.sights',
      filter: "circle:#{lat_long[:long]},#{lat_long[:lat]},20000"
    }
  end
end
