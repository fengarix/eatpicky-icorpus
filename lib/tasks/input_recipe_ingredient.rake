require 'tri_gram_generator.rb'

namespace :db do

  desc 'reading json file and saving it to database'
  task :input_recipe => :environment do |t, args|
    filename = 'recipe.json'
    json_recipe(false, filename)
  end

  desc 'testing if reading json file success'
  task :input_dryrun => :environment do |t, args|
    _, filename = ARGV
    filename = 'recipe.json' if !filename
    json(true, filename)
    exit
  end

  def json_recipe(is_dryrun, filename)
    file = File.read(Rails.root.join(filename))
    data = JSON.parse(file)
    data.each do |element|
      puts "save recipe #{element["title"]}"
      save_recipe(element) if !is_dryrun
    end
  end

  def save_recipe(element)
    @recipe = Recipe.create(title: element["title"])
    @recipe.save
    element["bahan"].each do |bahan|
      @ingredient = Ingredient.where(name: bahan)
      if @ingredient.empty?
        @ingredient = Ingredient.create(name: bahan)
        @recipe.ingredients << @ingredient
        TriGramGenerator.generate_tri_gram(@ingredient)
      else
        @recipe.ingredients << @ingredient[0]
        TriGramGenerator.generate_tri_gram(@ingredient[0])
      end
    end
  end
end