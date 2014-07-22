class Ingredient

	attr_accessor :quantity, :measure, :name
	attr_accessor :full_name

	attr_accessor :ingredient

	CONJUNCTIONS = [" de "," com ", " of "]
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
		@ingredient = ingredient
	end

	def extract
		if @ingredient.empty?
			{} 
		else
			conver_to_hash(@ingredient)
		end
	end

	def filter
 		# Removes hifen "-"
 		filtered_ingredient = filter_hifens @ingredient

    # Removes Complementary Words
    @ingredient = filter_conjunctions filtered_ingredient
	end


	private
	def filter_hifens string
		string.gsub("-"," ").split(" ").join(" ")
	end

	def filter_conjunctions string
		string.gsub(/\b(#{CONJUNCTIONS.join('|')})\b/mi, ' ')
	end

	# TODO
	def convert
		puts "Not completed yet."
	end

end