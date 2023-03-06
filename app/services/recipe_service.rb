class RecipeService
  def self.get(params = nil)
    conn = edamam_conn

    response = conn.get('/api/recipes/v2') do |req|
      req.params['q'] = params unless params.nil?
    end

    parse(response)
  end

  def self.edamam_conn
    Faraday.new(
      url: 'https://api.edamam.com',
      params: {
        type: 'public',
        app_id: ENV['edamam_app_id'],
        app_key: ENV['edamam_app_key']
      },
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
