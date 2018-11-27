class RecipeCard

  attr_reader :user, :recipe, :date, :rating

  @@all = []

  def self.all
    @@all
  end

  def initialize(user, recipe, rating)
    @user = user
    @recipe = recipe
    @date = "#{Time.now.month}-#{Time.now.day}-#{Time.now.year}"
    @rating = rating

    @@all << self
  end

end
