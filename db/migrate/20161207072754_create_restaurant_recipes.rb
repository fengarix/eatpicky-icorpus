class CreateRestaurantRecipes < ActiveRecord::Migration
  def change
    create_table :restaurant_recipes do |t|

      t.timestamps null: false
      t.references(:restaurant, foreign_key: true, index: true)
      t.references(:recipe, foreign_key: true, index: true)
    end
  end
end
