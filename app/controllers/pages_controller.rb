require 'weight_calculator.rb'
require 'alias_ingredient.rb'
require 'tri_gram_generator.rb'

class PagesController < ApplicationController

  def index
  end

  def show_result

    @want = params[:query][:wants].split(',')
    @not_want = params[:query][:not_wants].split(',')

    #Ubah dengan aliasnya
    @want = AliasIngredient.get_alias_ingredient(@want)
    @not_want = AliasIngredient.get_alias_ingredient(@not_want)

    #TRIGRAM METHOD HERE#
    tri_gram_handling_wants = tri_gram_handler(@want)
    tri_gram_handling_not_wants = tri_gram_handler(@not_want)

    @want = tri_gram_handling_wants[:can_process_original] + tri_gram_handling_wants[:can_process_recommendation]
    @not_want = tri_gram_handling_not_wants[:can_process_original] + tri_gram_handling_not_wants[:can_process_recommendation]
    @can_process_recommendation = tri_gram_handling_wants[:can_process_recommendation] + tri_gram_handling_not_wants[:can_process_recommendation]
    @can_not_process = tri_gram_handling_wants[:can_not_process] + tri_gram_handling_not_wants[:can_not_process]

    puts "CAN PROCESS RECOMMENDATION BEGINNING"
    puts @can_process_recommendation
    puts "CAN PROCESS RECOMMENDATION END"

    puts "CAN NOT PROCESS BEGINNING"
    puts @can_not_process
    puts "CAN NOT PROCESS END"
    # Ambil resep sesuai query want dan not_want
    recipes_result = Recipe.get_recipes_by_multiple_ingredients(@want, @not_want)
    @recipe_restaurants = []

    # puts "KAJSDKAJSND"
    # recipes_result.each do |p|
    #   puts p.title
    # end
    # puts recipes_result
    # Hitung weight per resep-restoran
    recipes_result.each do |recipe|
      recipe.restaurants.each do |restaurant|
          @recipe_restaurants.push({recipe: recipe, restaurant: restaurant, weight: WeightCalculator.calculate_weight_multiple_input(recipe, restaurant, @want)})
      end
    end

    sorted_recipe_restaurant = @recipe_restaurants.sort_by { |elm| elm[:weight] }.reverse
    restaurants = sorted_recipe_restaurant.map{|elm| elm[:restaurant]}.uniq

    # puts "SORTED BEGINNING"
    # puts @recipe_restaurants
    # puts "SORTED END"
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

  def tri_gram_handler(queries)

    # can_process, can_not_process
    hashed_result = {can_not_process: [], can_process_recommendation: [], can_process_original: []}
    queries.each do |q|

      arr = Ingredient.where('name LIKE ?', '%'+q+'%')

      if arr.empty?
        recommendation_ingredient = TriGramGenerator.get_nearest_ingredient(q)
        if recommendation_ingredient.nil?
          hashed_result[:can_not_process].push(q)
        else
          hashed_result[:can_process_recommendation].push(recommendation_ingredient)
        end
      else
        hashed_result[:can_process_original].push(q)
      end
    end
    return hashed_result
  end

end
