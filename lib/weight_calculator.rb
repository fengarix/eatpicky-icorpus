class WeightCalculator

  def self.calculate_weight(recipe, restaurant, want)
    weight = 0
    want = want.downcase
    puts recipe.title.downcase.include? want
    if recipe.title.downcase.include? want
      puts "MASUK INCLUDE"
      puts recipe.title
      weight += 70
    end
    weight += (6 * restaurant.rating)
  end

end