class TriGramGenerator

  def self.generate_tri_gram(ingredient)

    len = ingredient.name.length
    ingredient_name = ingredient.name.downcase
    i = 0
    j = 2
    min3 = len - 3

    if len > 3
      while j < len  do
        tri_gram = ingredient_name[i..j]
        query_tri_gram = TriGram.where(name: tri_gram)
      
        #Handle kalo gaada object trigram
        if query_tri_gram.empty?
          obj_tri_gram = TriGram.create(name: tri_gram)
          obj_tri_gram.ingredients << ingredient
        else
          query_tri_gram[0].ingredients << ingredient
        end
        i += 1
        j += 1
      end
    else
      tri_gram = ingredient_name
      query_tri_gram = TriGram.where(name: tri_gram)

      #Handle kalo gaada object trigram
      if query_tri_gram.empty?
        obj_tri_gram = TriGram.create(name: tri_gram)
        obj_tri_gram.ingredients << ingredient
      else
        query_tri_gram[0].ingredients << ingredient
      end
    end
  end

  def self.get_nearest_ingredient(query)

    #ingredient, value
    arr_ingredient_tri_gram = []
    query_tri_gram = get_tri_gram(query)
    puts  "ISI QUERY TRIGRAM"
    query_tri_gram.each do |q|
      puts q
    end
    

    if query_tri_gram.empty?
      return nil
    end

    ingredients = Ingredient.all

    i = 0
    #loop semua ingredient
    ingredients.each do |ingredient|
      #loop tiap trigram pada ingredient
      arr_ingredient_tri_gram.push({ingredient: ingredient, value: 0})
      ingredient.tri_grams.each do |ing_tri_gram|
        #check apakah ingredient tersebut memiliki trigram yang sama dengan query
        puts "ing_tri_gram"
        puts ing_tri_gram.name
        if query_tri_gram.include? ing_tri_gram.name
          arr_ingredient_tri_gram[i][:value] += 1
        end
      end
      i += 1
    end

    sorted_arr_ingredient_tri_gram = arr_ingredient_tri_gram.sort_by { |elm| elm[:value] }.reverse

    sorted_arr_ingredient_tri_gram.each do |elm|
      puts elm[:ingredient].name
      puts elm[:value]
    end

    if sorted_arr_ingredient_tri_gram[0][:value] == 0
      return nil
    else
      return sorted_arr_ingredient_tri_gram[0][:ingredient].name
    end
  end

  def self.get_tri_gram(query)
    len = query.length
    query.downcase!
    i = 0
    j = 2
    min3 = len - 3
    arr_result = []

    if len > 3
      while j < len  do
        arr_result.push(query[i..j])
        i += 1
        j += 1
      end
    else
      return []
    end
    return arr_result
  end

end