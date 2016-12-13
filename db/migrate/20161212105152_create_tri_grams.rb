class CreateTriGrams < ActiveRecord::Migration
  def change
    create_table :tri_grams do |t|

      t.timestamps null: false
      t.string :name
    end
  end
end
