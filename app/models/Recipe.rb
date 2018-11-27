require 'pry'

class Recipe

  attr :dish

  @@all = []

  def self.all
    @@all
  end

  def initialize(dish)
    @dish = dish

    @@all << self
  end

  def recipe_cards
    RecipeCard.all.select do |recipe_cards|
      recipe_cards.recipe == self
    end
  end

  def self.most_popular
    hash = Hash.new(0)
    Recipe.all.map do |recipe|
      hash[recipe] = recipe.recipe_cards.length
    end
    hash.sort_by{|k,v| v}[-1][0]
  end

  def users
    recipe_cards.map do |card|
      card.user
    end
  end

  def recipe_ingredient
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end
  end

  def all_ingredients
    ingredients_all = recipe_ingredient.map do |recipe_ingredient|
      recipe_ingredient.ingredients
    end
    ingredients_all[0]
  end

  def allergens
    array = []
    all_ingredients.each do |ingredient|
      # binding.pry
      Allergen.all.each do |allergen|
        # binding.pry
        if ingredient == allergen.ingredient
          array << ingredient
        end
      end
    end
    array
  end

  def add_ingredients(ingredients_array)
    ingredients_array.each do |new_ingredient|
      # binding.pry
      recipe_ingredient[0].ingredients << new_ingredient
    end
  end

end #end of class
