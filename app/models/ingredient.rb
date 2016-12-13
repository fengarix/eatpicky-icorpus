class Ingredient < ActiveRecord::Base
  has_many(:recipe_ingredients)
  has_many(:recipes, through: :recipe_ingredients)
  has_many(:alias)
  has_many(:ingredient_tri_grams)
  has_many(:tri_grams, through: :ingredient_tri_grams)
end
