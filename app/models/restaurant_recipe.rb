class RestaurantRecipe < ActiveRecord::Base
  belongs_to(:restaurant)
  belongs_to(:recipe)
end