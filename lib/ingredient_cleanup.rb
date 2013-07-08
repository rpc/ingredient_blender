class IngredientCleanup

	CONJUNCTIONS = [" de "," com ", " of "]

	attr_accessor :ingredient

	def initialize(ingredient)
		@ingredient = ingredient
	end

	def cleanup
		unless @ingredient.original_name.empty?
	 		# Removes hifen "-"
	 		filtered_ingredient = filter_hifens @ingredient.original_name

	    # Removes Complementary Words
	    @ingredient.original_name = filter_conjunctions filtered_ingredient
  	end
  	@ingredient
	end

	private
	def filter_hifens ingredient_original_name
		ingredient_original_name.gsub("-"," ").split(" ").join(" ")
	end

	def filter_conjunctions ingredient_original_name
		ingredient_original_name.gsub(/\b(#{CONJUNCTIONS.join('|')})\b/mi, ' ')
	end	

end