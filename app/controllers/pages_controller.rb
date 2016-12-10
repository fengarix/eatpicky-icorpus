require 'weight_calculator.rb'

class PagesController < ApplicationController

  def index
  end

  def show_result
    # @want = ["Ayam", "Teh"]
    # @not_want = ["Cabai"]

    puts params[:query][:wants]
    puts params[:query][:not_wants]
    @want = params[:query][:wants].split(',')
    @not_want = params[:query][:not_wants].split(',')

    # Ambil resep sesuai query want dan not_want
    recipes_result = Recipe.get_recipes_by_multiple_ingredients(@want, @not_want)
    @recipe_restaurants = []

    puts "KAJSDKAJSND"
    puts recipes_result
    # Hitung weight per resep-restoran
    recipes_result.each do |recipe|
      recipe.restaurants.each do |restaurant|
          @recipe_restaurants.push({recipe: recipe, restaurant: restaurant, weight: WeightCalculator.calculate_weight_multiple_input(recipe, restaurant, @want)})
      end
    end

    sorted_recipe_restaurant = @recipe_restaurants.sort_by { |elm| elm[:weight] }.reverse
    restaurants = sorted_recipe_restaurant.map{|elm| elm[:restaurant]}.uniq

    puts "SORTED BEGINNING"
    puts @recipe_restaurants
    puts "SORTED END"
    @result = []
    (0..4).each do |i|
      break if restaurants[i] == nil
      @result.push({restaurant: restaurants[i], recipes: [], weight: []})
      idx = 0
      while (@result[i][:recipes].length < 3) do
        break if idx >= sorted_recipe_restaurant.length
        if (sorted_recipe_restaurant[idx][:restaurant] == @result[i][:restaurant])
          @result[i][:recipes].push(sorted_recipe_restaurant[idx][:recipe])
          @result[i][:weight].push(sorted_recipe_restaurant[idx][:weight])
          idx += 1
        else
          idx += 1
        end
      end
    end
    puts @result
  end

end
