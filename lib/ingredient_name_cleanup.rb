# ***********************************************
# * Class responsible for removing unwanted noise 
# * from the original ingredients name
# *
# * > Removes Conjunction words: "de", "com", "of"
# * > Removes Hifens (e.g.: "-")
# * > Removes Whitespaces
# ***********************************************

class IngredientNameCleanup

	CONJUNCTIONS = [" de "," com ", " of "]

	attr_accessor :clean_ingredient_name

	def initialize(ingredient_name)
		@clean_ingredient_name = ingredient_name
	end

	def cleanup
		unless @clean_ingredient_name.empty?
	 		# Removes hifen "-"
	 		@clean_ingredient_name = filter_hifens @clean_ingredient_name

	    # Removes Complementary Words
	    @clean_ingredient_name = filter_conjunctions @clean_ingredient_name
  	end
  	@clean_ingredient_name
	end

	private
	def filter_hifens ingredient_name
		ingredient_name.gsub("-"," ").split(" ").join(" ")
	end

	def filter_conjunctions ingredient_name
		ingredient_name.gsub(/\b(#{CONJUNCTIONS.join('|')})\b/mi, ' ')
	end	

end