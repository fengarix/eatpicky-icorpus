class WeightCalculator

  def self.calculate_weight(recipe, restaurant, want)
    weight = 0
    if recipe.title.downcase.include? want
      weight += 70
    end
    weight += (6 * restaurant.rating)
  end

end