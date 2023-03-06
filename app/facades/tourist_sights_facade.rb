class TouristSightsFacade
  def self.country(country)
    sight_data = TouristSightsService.get(CapitalFacade.get(country))

    sight_data[:features].map do |sight|
      TouristSight.new(sight)
    end
  end

  # def self.capital_details(country)
  #   CapitalFacade.get(country)
  # end
end
