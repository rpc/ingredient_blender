class Ingredient

	attr_accessor :quantity, :measure, :name
	attr_accessor :full_name

  MEASURE = ["colheres",
  					 "pacote",
  					 "quarts",
  					 "teaspoon",
  					 "cups",
  					 "tablespoons",
  					 "ounces",
  					 "ounce"]	

	def initialize(ingredient_as_string)
		@full_name = ingredient_as_string
	end

end