class Recipe < ActiveRecord::Base
  has_many(:recipe_ingredients)
  has_many(:ingredients, through: :recipe_ingredients)
  has_many(:restaurant_recipes)
  has_many(:restaurants, through: :restaurant_recipes)
end

