class Wine 

  attr_accessor :type, :name, :budget, :sale_price, :producer, :country_of_origin, :grape_variety, :region

  def initialize(type, name, budget, sale_price, producer, country_of_origin, grape_variety, region)
    @type = type
    @name = name
    @budget = budget 
    @sale_price = sale_price
    @producer = producer
    @country_of_origin = country_of_origin
    @grape_variety = grape_variety
    @region = region
  end
end