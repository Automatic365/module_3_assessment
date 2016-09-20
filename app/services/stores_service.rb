class StoresService
  attr_reader :conn

  def initialize
    @conn = Faraday.new("https://api.bestbuy.com")
  end

  def find_store_by_zipcode(zipcode)
    response = conn.get("/v1/stores(area(#{zipcode},25))") do |req|
      req.params['apiKey'] = ENV['BEST_BUY_API_KEY']
      req.params['show'] = 'storeId,longName,city,distance,phone,storeType'
      req.params['pageSize'] = '15'
      req.params['format'] = 'json'
    end
    parse(response.body)
  end

  private

  def parse(response)
    JSON.parse(response, object_class: OpenStruct)
  end

end
