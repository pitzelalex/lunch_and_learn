class Image
  attr_reader :url,
              :alt_tag

  def initialize(data)
    @url = data[:urls][:full]
    @alt_tag = data[:alt_description]
  end
end
