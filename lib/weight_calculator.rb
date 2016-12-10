class WeightCalculator

  def self.calculate_weight_single_input(recipe, restaurant, want)
    weight = 0
    want = want.downcase

    # Perhitungan bobot title jika di title terdapat nama bahan
    if recipe.title.downcase.include? want
      weight += 70
    end

    # Perhitungan bobot rating
    weight += (6 * restaurant.rating)
  end

  def self.calculate_weight_multiple_input(recipe, restaurant, wants)

    weight = 0


    wants.each do |want|
      want = want.downcase

      # Perhitungan bobot title jika di title terdapat nama bahan
      if recipe.title.downcase.include? want
        weight += 70
      end

      # Perhitungan bobot bahan resep jika di bahan resep terdapat bahan
      recipe.ingredients.each do |ingredient|
        if ingredient.name.downcase.include? want
          weight += 40
        end
      end
    end

    # Perhitungan bobot rating
    weight += (6 * restaurant.rating)

  end

end