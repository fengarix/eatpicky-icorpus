namespace :db do
  desc 'seed alias ingredient'
  task :alias_ingredient => :environment do

  add_aliases('lada', %w(merica ladaku))
  add_aliases('cabai', %w(cabe))
  add_aliases('bawang', %w(bw bwg))
  add_aliases('kecap asin', %w(soy))
  add_aliases('tauge', %w(toge))
  add_aliases('serai', %w(sereh))
  add_aliases('gula jawa', %w(gula merah))
  add_aliases('limau', %w(limo))

  end

  def add_aliases(ingredient, aliases)
    bahan = Ingredient.where('lower(name) LIKE ?', '%' + ingredient + '%').first
    aliases.each do |name_alias|
      Alias.create(name: name_alias, ingredient: bahan)
    end
  end

end