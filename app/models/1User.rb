class User

  attr_reader :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name

    @@all << self
  end

  def recipe_cards
    RecipeCard.all.select do |recipe_cards|
      recipe_cards.user == self
    end
  end

  def recipes
    recipe_cards.map do |card|
      card.recipe
    end
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def user_allergens
    Allergen.all.select do |allergen_card|
      allergen_card.user == self
    end
  end

  def top_three_recipes
    #return top 3 highest rated
    hash = Hash.new(0)
    recipe_cards.each do |recipecard|
      hash[recipecard] = recipecard.rating
    end
    output = hash.sort_by{|k,v| v}[-3..-1]
    array = []
    output.each do |recipecard|
      array << recipecard[0]
    end
    array
  end

  def most_recent_recipe
    recipe_cards[-1].recipe
  end

  def safe_recipes
    array = []
    RecipeIngredient.all.select do |recipe_ingredient_card|
      recipe_ingredient_card.ingredients.each do |ingredient|
        user_allergens.each do |allergen|
          if ingredient == allergen.ingredient
            array << recipe_ingredient_card.recipe
        end
      end
    end
    #return all recipes that do not contain ingredients
    end
    Recipe.all - array
  end

end
