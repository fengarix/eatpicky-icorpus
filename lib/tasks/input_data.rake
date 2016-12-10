namespace :db do

  desc 'reading json file and saving it to database'
  task :input => :environment do |t, args|
    _, filename = ARGV
    filename = 'test.json' if !filename
    json(false, filename)
    exit
  end

  desc 'testing if reading json file success'
  task :input_dryrun => :environment do |t, args|
    _, filename = ARGV
    filename = 'test.json' if !filename
    json(true, filename)
    exit
  end

  def json(is_dryrun, filename)
    file = File.read(Rails.root.join(filename))
    data = data_hash = JSON.parse(file)
    data.each do |element|
      save(element) if !is_dryrun
    end
  end

  def save(element)
    @recipe = Recipe.create(title: element["title"])
    @recipe.save
    element["bahan"].each do |bahan|
      @ingredient = Ingredient.where(name: bahan)
      if @ingredient.empty?
        @ingredient = Ingredient.create(name: bahan)
        @recipe.ingredients << @ingredient
      else
        @recipe.ingredients << @ingredient[0]
      end
    end
  end
end