class RecipeIngredient

    attr_reader :recipe
    attr_accessor :ingredients

    @@all = []

    def self.all
      @@all
    end

    def initialize(recipe, ingredients)
      @recipe = recipe
      @ingredients = ingredients

      @@all << self
    end

end
