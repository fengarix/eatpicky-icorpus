class TriGram < ActiveRecord::Base
  has_many(:ingredient_tri_grams)
  has_many(:ingredients, through: :ingredient_tri_grams)
end
