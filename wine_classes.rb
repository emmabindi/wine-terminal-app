class Wine 

  attr_accessor :type, :name, :budget, :sale_price, :producer, :country_of_origin, :grape_variety

  type = ['Sparkling', 'White', 'Rose', 'Orange', 'Red', 'Surprise']

  def initialize(type, name, budget, sale_price, producer, country_of_origin, grape_variety)
    @type = type
    @name = name
    @budget = budget 
    @sale_price = sale_price
    @producer = producer
    @country_of_origin = country_of_origin
    @grape_variety = grape_variety
  end
end

#Sparkling



#White

rfreak = Wine.new("White", "Eden Valley Riesling No 4", 1, $24, "Riesling Freak", "Australia", "Riesling")

goisot = Wine.new("White", "Saint Bris Goisot", 3, "$74", "Domaine Goisot", "France", "Sauvignon Blanc")

#Rose

#Orange

amrit = Wine.new("Orange", "Amrit", 2, "$45", "Avani", "Australia", "Skin Contact Pinot Gris")

#Red