require "spec_helper"

describe Ingredient  do

	subject{ Ingredient.new("sugar, spice and everything nice") }

	it { expect(subject.full_name).to eq("sugar, spice and everything nice")  }

end