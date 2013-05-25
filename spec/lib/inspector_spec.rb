require "spec_helper"
require "inspector"

describe Inspector  do

	it "should create empty hash when passing empty params" do
		Inspector.new("").extract.should be_empty
	end

	context "#filter" do

		it "should remove ifens" do
 			Inspector.new("2 cups - sugar").filter.should match "2 cups  sugar"
		end

		# Like "of" "de" "com"
		it "should remove conjuntion words" do
 			Inspector.new("2 cups of sugar").filter.should match "2 cups sugar"
 			Inspector.new("2 colheres de manteiga").filter.should match "2 colheres manteiga"
		end		

	end

end