require_relative '../config/environment.rb'

josh = User.new("Josh")
thao = User.new("Thao")
isaac = User.new("Isaac")

turkey_dinner = Recipe.new("Turkey Dinner")
pasta = Recipe.new("Fettucine Alfredo")
egg_salad = Recipe.new("Egg Salad")
salad = Recipe.new("Southwest Chicken Salad")

              # (user, recipe, date, rating)
r1 = RecipeCard.new(josh, egg_salad, 5)
r2 = RecipeCard.new(thao, pasta, 6)
r3 = RecipeCard.new(isaac, turkey_dinner, 10)
r4 = RecipeCard.new(josh, turkey_dinner, 8)
r5 = RecipeCard.new(josh, pasta, 9)
r6 = RecipeCard.new(josh, salad, 8)


#recipe, ingredients

i1 = Ingredient.new("Fettucine")
i2 = Ingredient.new("cheese")
i3 = Ingredient.new("chicken")
i4 = Ingredient.new("eggs")
i5 = Ingredient.new("mayo")
i6 = Ingredient.new("mashed potatoes")


a1 = Allergen.new(thao, i3)
a2 = Allergen.new(josh, i4)
a3 = Allergen.new(josh, i2)


ri1 = RecipeIngredient.new(pasta,[i1, i2, i3])
ri2 = RecipeIngredient.new(egg_salad,[i4, i5])
ri3 = RecipeIngredient.new(turkey_dinner,[i3, i6])




binding.pry
