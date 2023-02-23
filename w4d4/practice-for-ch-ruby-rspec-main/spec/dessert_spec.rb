require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:cookie) {Dessert.new("Baked Goods", 50, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cookie.type).to eq("Baked Goods")
    end

    it "sets a quantity" do
      expect(cookie.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do 
      expect(cookie.ingredients.length).to eq(0)
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("cake", "many", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cookie.add_ingredient("flour")
      expect(cookie.ingredients).to include("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
    list = ['flour', 'sugar', 'egg', 'butter', 'chocolate chips']
    list.each { |ingredient| cookie.add_ingredient(ingredient)}
    cookie.mix!
    expect(cookie.ingredients).not_to eq(list)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(cookie.eat(5)).to eq(45)
    end

    it "raises an error if the amount is greater than the quantity" do
    expect{ cookie.eat(51)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      allow(chef).to receive(:titleize).and_return("Chef chef the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookie)
      cookie.make_more
    end
  end
end