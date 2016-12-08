class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|

      t.timestamps null: false
      t.string :name, index: true
    end
  end
end
