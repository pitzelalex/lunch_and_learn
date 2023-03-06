class CountryFacade
  def self.random
    country_data = Rails.cache.fetch('all_countries', expires_in: 12.seconds) do
      CountryService.all
    end

    country_data.sample[:name][:common]
  end
end
