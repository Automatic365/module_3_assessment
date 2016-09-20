class Store < OpenStruct
  attr_reader :service

  def self.service
    @service = StoresService.new
  end

  def self.find_store_by_zipcode(zipcode)
    raw_stores = service.find_store_by_zipcode(zipcode)

    stores = raw_stores["stores"].map do |raw_store|
      Store.new(raw_store)
    end
    return stores, raw_stores["total"]
  end

  def self.find_store_by_id(store_id)
    raw_store = service.find_store_by_id(store_id)

    raw_store["stores"].map do |raw_store|
      Store.new(raw_store)
    end[0]
  end

  def store_hours
    hoursAmPm.split("; ")
  end

end
