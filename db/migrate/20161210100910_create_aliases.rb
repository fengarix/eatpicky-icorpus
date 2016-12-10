class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|

      t.timestamps null: false
      t.string :name, index: true
      t.references(:ingredient, foreign_key: true, index: true)
    end
  end
end
