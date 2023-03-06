class CapitalFacade
  def self.get(country)
    latlng = CapitalService.get(country)[0][:capitalInfo][:latlng]

    {
      lat: latlng[0],
      long: latlng[1]
    }
  end
end
