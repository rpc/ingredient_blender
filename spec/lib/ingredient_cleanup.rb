require "spec_helper"
require "ingredient_cleanup"
require "ingredient"

describe IngredientCleanup  do

	it "should create empty hash when passing empty params" do
		ingredient = Ingredient.new("")
		IngredientCleanup.new(ingredient).cleanup.should be_instance_of(Ingredient)
	end

	context "#cleanup" do

		it "should remove ifens with blank spaces" do
			ingredient = Ingredient.new("2 cups - sugar")
 			IngredientCleanup.new(ingredient).cleanup.original_name.should match '2 cups sugar'
		end

		it "should remove ifens without blank spaces" do
			ingredient = Ingredient.new("2 cups-sugar")
 			IngredientCleanup.new(ingredient).cleanup.original_name.should match '2 cups sugar'
		end		

		# Like "of" "de" "com"
		it "should remove conjuntion words" do
			ingredient = Ingredient.new("2 cups of sugar")
			IngredientCleanup.new(ingredient).cleanup.original_name.should match '2 cups sugar'

			ingredient2 = Ingredient.new("2 colheres de manteiga") 			
 			IngredientCleanup.new(ingredient2).cleanup.original_name.should match '2 colheres manteiga'
		end		

	end

end