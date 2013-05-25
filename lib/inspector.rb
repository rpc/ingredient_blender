class Inspector

	attr_accessor :ingredient

	CONJUNCTIONS = [" de "," com ", " of "]
  MEASURE = ["colheres","pacote","quarts","teaspoon","cups","tablespoons","ounces","ounce"]	

	def initialize(ingredient)
		@ingredient = ingredient
	end

	def extract
		{} 
		if @ingredient.empty?
			{} 
		else
			# do complex stuff
		end
	end

	def filter
 		# Removes hifen "-"
    filtered_ingredient = @ingredient.gsub("-","")    

    # Removes Complementary Words
    filtered_ingredient.gsub(/\b(#{CONJUNCTIONS.join('|')})\b/mi, ' ')
	end

	# TODO
	def convert
		puts "Not completed yet."
	end

end