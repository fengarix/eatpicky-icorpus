class Recipe < ActiveRecord::Base
  has_many(:recipe_ingredients)
  has_many(:ingredients, through: :recipe_ingredients)
  has_many(:restaurant_recipes)
  has_many(:restaurants, through: :restaurant_recipes)

  def self.get_recipes_by_ingredients(want, not_want)
    @recipes = get_recipes_by_not_wants(get_recipes_by_wants(want), not_want)
  end

  def self.get_recipes_by_wants(want)
    recipes = Recipe.joins(:ingredients).where('ingredients.name = ?', want).uniq!
  end

  def self.get_recipes_by_not_wants(arr_recipe_wants, not_want)
    arr_recipe_wants.select{|recipe| !recipe.ingredients.where(name: not_want).present?}
  end

end




