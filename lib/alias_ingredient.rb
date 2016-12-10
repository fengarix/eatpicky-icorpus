class AliasIngredient

  def self.get_alias_ingredient(arr_ingredients)

    puts "SEBELUM DIUBAH"
    arr_ingredients_new = []
    arr_ingredients.each do |ing|
      alias_ingredient = Alias.where('name = ?', ing)
      puts ing
      if (alias_ingredient.empty?)
        puts "empty"
        arr_ingredients_new.push(ing)
      else
        puts "gak empty"
        puts alias_ingredient[0].name
        arr_ingredients_new.push(alias_ingredient[0].ingredient.name)
      end
    end

    puts "SETELAH DIUBAH"
    arr_ingredients_new.each do |ing_new|
      puts ing_new
    end

    return arr_ingredients_new
  end

end