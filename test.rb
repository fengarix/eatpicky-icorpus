input_bahan_ingin = "ayam"
input_bahan_tidak_ingin = "cabai"


#ambil bahan yang diinginkan
recipes = Ingredient.where('name = ?', input_bahan_ingin).recipes

recipes.each do |recipe|
  
end



# Recipe.join(:ingredients).where('ingredients.name != ?', tomat).uniq!

Recipe.where('lower(title) LIKE ?', '%ayam%')

