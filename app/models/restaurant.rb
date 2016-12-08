class Restaurant < ActiveRecord::Base
  has_many(:restaurant_recipes)
  has_many(:recipes, through: :restaurant_recipes)
end
