class Ingredient

  attr_reader :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.most_common_allergen
      hash = Hash.new(0)
      Allergen.all.each do |allergen|
        if hash[allergen.ingredient] == nil
          hash[allergen.ingredient] = 1
        else hash[allergen.ingredient] += 1
        end
      end
      hash.sort_by{|k,v| v}[-1][0]
  end

end
