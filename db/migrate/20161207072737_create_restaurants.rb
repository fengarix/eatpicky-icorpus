class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|

      t.timestamps null: false
      t.string :name
      t.float :rating
      t.string :location
    end
  end
end
