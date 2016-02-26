class Uber
  include HTTParty
  require 'json'

  base_uri 'https://api.uber.com/v1'
  headers 'Authorization' => 'Token ZQM2mZB1BXIA28upGt83OMlaDHtfkGzq3FSDtBHO'

  def price_estimate(options)
    path = '/estimates/price'
    data = self.class.get(path, options)
    JSON.parse(data.body)['prices']
  end

  def get_surge_data(lat, long)
    surge_data = self.price_estimate({
      query: {
        start_latitude: lat,
        start_longitude: long,
        end_latitude: lat,
        end_longitude: long
      }
    })
    surge_data.collect do |item|
      { surge_multiplier: item['surge_multiplier'], product: item['localized_display_name'] }
    end
  end
end
