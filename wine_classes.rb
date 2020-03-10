class Wine 

  attr_accessor :type, :name, :budget, :sale_price, :producer, :country_origin, :grape_variety

  type = ['Sparkling', 'White', 'Rose', 'Orange', 'Red']

  def initialize(type, name, budget, sale_price, producer, country_origin, grape_variety)
    @type = type
    @name = name
    @budget = budget 
    @sale_price = sale_price
    @producer = producer
    @country_origin = country_origin
    @grape_variety = grape_variety
  end
end

amrit = Wine.new("Orange", "Amrit", 2, "$45", "Avani", "Australia", "Skin Contact Pinot Gris")

saintbris = Wine.new("White", "Saint Bris", 3, "$74", "Domaine Goisot", "France", "Sauvignon Blanc")