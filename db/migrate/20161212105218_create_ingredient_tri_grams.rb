class CreateIngredientTriGrams < ActiveRecord::Migration
  def change
    create_table :ingredient_tri_grams do |t|

      t.timestamps null: false
      t.references(:tri_gram, foreign_key: true, index: true)
      t.references(:ingredient, foreign_key: true, index: true)
    end
  end
end
