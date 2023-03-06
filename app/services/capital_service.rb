class CapitalService
  def self.get(country)
    response = conn.get("/v3.1/name/#{country}")

    parse(response)
  end

  def self.conn
    Faraday.new(url: 'https://restcountries.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
