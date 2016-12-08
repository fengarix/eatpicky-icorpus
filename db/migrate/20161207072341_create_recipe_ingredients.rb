class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|

      t.timestamps null: false
      t.references(:recipe, foreign_key: true, index: true)
      t.references(:ingredient, foreign_key: true, index: true)
    end
  end
end
