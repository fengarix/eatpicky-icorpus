# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'tri_gram_generator.rb'

tomat = Ingredient.create(name: "Tomat")
cabai = Ingredient.create(name: "Cabai")
susu = Ingredient.create(name: "Susu")
tepung = Ingredient.create(name: "Tepung")
tepung_sagu = Ingredient.create(name: "Tepung Sagu")
teh = Ingredient.create(name: "Teh")
ayam = Ingredient.create(name: "Ayam")
merica = Ingredient.create(name: "Merica")

ingredients = Ingredient.all

ingredients.each do |ing|
  puts ing.name
  TriGramGenerator.generate_tri_gram(ing)
end

ayam_goreng = Recipe.create(title: "Ayam Goreng")
teh_tarik = Recipe.create(title: "Teh Tarik")
ayam_cabai = Recipe.create(title: "Ayam Cabai")
pizza_ayam = Recipe.create(title: "Pizza")
teh_ayam_tanpa_title = Recipe.create(title: "Chicken Tea")
teh_ayam_dengan_title = Recipe.create(title: "Teh Ayam")
kue = Recipe.create(title: "Kue")

resto_a = Restaurant.create(name: "A", rating: 5, location: "Depok")
resto_b = Restaurant.create(name: "B", rating: 4.5, location: "Depok")
resto_c = Restaurant.create(name: "C", rating: 4, location: "Depok")
resto_d = Restaurant.create(name: "D", rating: 3.5, location: "Depok")
resto_e = Restaurant.create(name: "E", rating: 3, location: "Depok")

resto_a.recipes << ayam_goreng
resto_a.recipes << teh_tarik
resto_b.recipes << ayam_cabai
resto_c.recipes << teh_tarik
resto_d.recipes << ayam_goreng
resto_d.recipes << pizza_ayam
resto_e.recipes << ayam_goreng
resto_a.recipes << teh_ayam_dengan_title
resto_a.recipes << teh_ayam_tanpa_title
resto_b.recipes << kue

ayam_goreng.ingredients << ayam
ayam_goreng.ingredients << tepung
ayam_goreng.ingredients << merica
teh_tarik.ingredients << teh
teh_tarik.ingredients << susu
ayam_cabai.ingredients << ayam
ayam_cabai.ingredients << cabai
ayam_cabai.ingredients << tomat
pizza_ayam.ingredients << tomat
pizza_ayam.ingredients << ayam
pizza_ayam.ingredients << tepung
teh_ayam_tanpa_title.ingredients << teh
teh_ayam_tanpa_title.ingredients << ayam
teh_ayam_dengan_title.ingredients << teh
teh_ayam_dengan_title.ingredients << ayam
kue.ingredients << tepung_sagu


## ALIAS

cabe = Alias.create(name: "Cabe")
lada = Alias.create(name: "Lada")

merica.alias << lada
cabai.alias << cabe