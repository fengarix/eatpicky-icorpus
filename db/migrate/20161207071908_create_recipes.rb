class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|

      t.timestamps null: false
      t.string :title
    end
  end
end
