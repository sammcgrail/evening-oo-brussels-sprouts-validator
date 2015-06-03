require "pry"
class Ingredient
  attr_reader :name, :unit, :quantity
  # The constructor is always called `initialize`   !!!!!
  def initialize(quantity, unit, name)
    @quantity = quantity
    @unit = unit
    @name = name
    @acceptable_ingredients = [
                                "brussels sprouts", "spinach",
                                "eggs", "milk", "tofu", "seitan", "bell peppers",
                                "quinoa", "kale", "chocolate", "beer", "wine", "whiskey"
                              ]
  end

  def ingredient_checker
    @acceptable_ingredients.include?(@name.downcase)
  end


  def self.parse(ingredient_string)
    split = ingredient_string.split(" ",3)
    name = split[2]
    quantity = split[0]
    unit = split[1]
    Ingredient.new(quantity, unit, name)
  end



  def summary
    "#{@quantity} #{@unit} #{@name}"
  end
end
class Recipe
  def initialize(name, instructions, ingredients)
    @name = name
    @instructions = instructions
    @ingredients = ingredients
  end
  def list_instructions
    step_number = 1
    instruction_string = ""
    @instructions.each do |instruction|
       instruction_string = instruction_string + "#{step_number}. #{instruction} \n"
      step_number += 1
    end
    instruction_string
  end
  def list_ingredients
    ingredient_string= ""
    @ingredients.each do |ingredient|
       ingredient_string = ingredient_string + "- #{ingredient.summary} \n"
    end
    ingredient_string
  end
  def list_name
     "Name: #{@name}"
  end

  def recipe_allergy_checker
    @ingredients.each do |ingredient|
      if ingredient.ingredient_checker == false
        return false
      end
    end
    true
  end

  def summary
     puts <<"SUMMARY"
#{list_name}

Ingredients
#{list_ingredients}

Instructions
#{list_instructions}
SUMMARY
  end
end
### DATA
name = "Roasted Brussels Sprouts"

ingredients = [
    Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
    Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
    Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
    Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
]

instructions = [
    "Preheat oven to 400 degrees F.",
    "Cut off the brown ends of the Brussels sprouts.",
    "Pull off any yellow outer leaves.",
    "Mix them in a bowl with the olive oil, salt and pepper.",
    "Pour them on a sheet pan and roast for 35 to 40 minutes.",
    "They should be until crisp on the outside and tender on the inside.",
    "Shake the pan from time to time to brown the sprouts evenly.",
    "Sprinkle with more kosher salt ( I like these salty like French fries).",
    "Serve and enjoy!"
    ]

### NEW RECIPE example

name2 = "Sweet Spinach"

ingredients2 = [
    Ingredient.new(1.5, "lb(s)", "Spinach"),
    Ingredient.new(3.0, "ltr(s)", "kale"),
    Ingredient.new(0.75, "tspn(s)", "chocolate"),
]

instructions2 = [
    "Boil water.",
    "Add water to spinach.",
    "Add sugar to spinach.",
    "Cool.",
    "Eat."
    ]

### TESTS
recipe_1 = Recipe.new(name, instructions, ingredients)
recipe_2 = Recipe.new(name2, instructions2, ingredients2)
puts "\n"
puts "Checking method returns with puts statements\n\n"

ingredient_1 = Ingredient.parse("1.5 lb(s) Brussel sprouts")
ingredient_2 = Ingredient.parse("7.5 tonnes(s) Hot wings")

puts "outputting new ingredient objects parsed from strings\n"
puts ingredient_1.name
puts ingredient_2.name

puts "\noutputting summary of new ingredient objects parsed from strings\n"
puts ingredient_1.summary
puts ingredient_2.summary

puts "\nchecking against accepted ingredients at critical points in loop\n"
puts "\nAre all the ingredients approved? (T/F)\n"
puts recipe_1.recipe_allergy_checker
puts "\nIs the first ingredient approved? (T/F)\n"
puts ingredients.first.ingredient_checker

puts "\nFull output from previous exercise\n"
recipe_1.summary

### TESTS ON USER EXAMPLE NEW RECIPE

puts "\nchecking against accepted ingredients at critical points in loop for new recipe\n"
puts "\nAre all the ingredients approved? (T/F)\n"
puts recipe_2.recipe_allergy_checker
puts "\nIs the first ingredient approved? (T/F)\n"
puts ingredients2.first.ingredient_checker

puts "\nFull output from new recipe example\n"
recipe_2.summary



# ###1
# Implement an instance method in your Ingredient class that helps check whether an ingredient
# is valid (i.e., contains only the ingredient names above)?
# ###2
# Write a Recipe instance method that returns true or false
# dependent on whether or not your client can have that particular dish.
#
# ###3
# What if your input to your Ingredient class comes in a different format?
#
# Write an Ingredient class method called parse which takes in a string
# that will look like 47 lb(s) Brussels sprouts or 5 tspn(s) milk
# and generates a variable of the Ingredient class in the right format.
#
# ### CLIENT CAN ONLY EAT THESE FOODS
# brussels sprouts
# spinach
# eggs
# milk
# tofu
# seitan
# bell peppers
# quinoa
# kale
# chocolate
# beer
# wine
# whiskey
#
# ## OUTPUT
#
# Submit your updated code in code.rb
# and include some example cases
# (meaning, generate your own recipe with name,
# instructions and ingredients)
#
# recipe = Recipe.new(name, instructions, ingredients)
#
# and return your validations of these recipes
# (whether or not they fit the criteria
# in the instructions above).
