Inredient.where('name = ?', tomat).recipes
Recipe.join(:ingredients).where('ingredients.name != ?', tomat).uniq!