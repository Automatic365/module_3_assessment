class Store < OpenStruct
  attr_reader :service

  def self.service
    @service = StoresService.new
  end

  def find_store_by_zipcode(zipcode)
    service.find_store_by_zipcode(zipcode)
  end

end
