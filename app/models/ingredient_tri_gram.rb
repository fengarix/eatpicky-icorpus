class IngredientTriGram < ActiveRecord::Base
  belongs_to(:ingredient)
  belongs_to(:tri_gram)
end
