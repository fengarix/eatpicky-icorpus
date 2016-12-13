# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161212105218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aliases", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.integer  "ingredient_id"
  end

  add_index "aliases", ["ingredient_id"], name: "index_aliases_on_ingredient_id", using: :btree
  add_index "aliases", ["name"], name: "index_aliases_on_name", using: :btree

  create_table "ingredient_tri_grams", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "tri_gram_id"
    t.integer  "ingredient_id"
  end

  add_index "ingredient_tri_grams", ["ingredient_id"], name: "index_ingredient_tri_grams_on_ingredient_id", using: :btree
  add_index "ingredient_tri_grams", ["tri_gram_id"], name: "index_ingredient_tri_grams_on_tri_gram_id", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "ingredients", ["name"], name: "index_ingredients_on_name", using: :btree

  create_table "recipe_ingredients", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
  end

  add_index "recipe_ingredients", ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id", using: :btree
  add_index "recipe_ingredients", ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  create_table "restaurant_recipes", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "restaurant_id"
    t.integer  "recipe_id"
  end

  add_index "restaurant_recipes", ["recipe_id"], name: "index_restaurant_recipes_on_recipe_id", using: :btree
  add_index "restaurant_recipes", ["restaurant_id"], name: "index_restaurant_recipes_on_restaurant_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.float    "rating"
    t.string   "location"
  end

  create_table "tri_grams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_foreign_key "aliases", "ingredients"
  add_foreign_key "ingredient_tri_grams", "ingredients"
  add_foreign_key "ingredient_tri_grams", "tri_grams"
  add_foreign_key "recipe_ingredients", "ingredients"
  add_foreign_key "recipe_ingredients", "recipes"
  add_foreign_key "restaurant_recipes", "recipes"
  add_foreign_key "restaurant_recipes", "restaurants"
end
