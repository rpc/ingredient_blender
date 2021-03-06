require "spec_helper"

describe IngredientNameCleanup  do

	context "#cleanup" do

		describe "instantiation" do
			it "should create empty hash when passing empty params" do
				ingredient = Ingredient.new("")
				expect(cleanup_ingredient(ingredient.full_name)).to be_instance_of(String)
			end
		end

		describe "removes hifens" do
			it "should remove ifens with blank spaces" do
				ingredient = Ingredient.new("2 cups - sugar")
				expect(cleanup_ingredient(ingredient.full_name)).to eq('2 cups sugar')
			end

			it "should remove ifens without blank spaces" do
				ingredient = Ingredient.new("2 cups-flour")
				expect(cleanup_ingredient(ingredient.full_name)).to eq('2 cups flour')
			end		
		end

		# Conjunctions words examples are: "of" "de" "com"
		describe "removes conjunctions" do
			it "should remove conjuntion words" do
				ingredient = Ingredient.new("2 cups of tea")
				expect(cleanup_ingredient(ingredient.full_name)).to eq('2 cups tea')
			end
		end

		# Conjunctions words examples are: "of" "de" "com"
		describe "removes non alphanumeric characters" do
			it "should remove conjuntion words" do
				ingredient = Ingredient.new("2 cups of-eggs *++ ")
				expect(cleanup_ingredient(ingredient.full_name)).to eq('2 cups eggs')
			end
		end

	end

	private
	def cleanup_ingredient ingredient_name
		IngredientNameCleanup.new(ingredient_name).cleanup
	end

end
