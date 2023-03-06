class TouristSightsFacade
  def self.country(country)
    lat_long = capital_details(country)
    require 'pry'; binding.pry
  end

  def self.capital_details(country)
    CapitalFacade.get(country)
  end
end
