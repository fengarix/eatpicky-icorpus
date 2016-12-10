namespace :db do
  desc 'seed alias ingredient'
  task :alias_ingredient => :environment do

  add_aliases('lada', %w(merica ladaku))
  add_aliases('cabai', %w(cabe))
  add_aliases('bawang', %w(bw bwg))
  add_aliases('kecap asin', %w(soy sauce))
  add_aliases('tauge', %w(toge))
  add_aliases('serai', %w(sereh))
  add_aliases('gula jawa', %w(gula merah))
  add_aliases('limau', %w(limo))
  add_aliases('limau', %w(limo))

  end

  def add_aliases(ingredient, aliases)
    bahan = Ingredient.where('lower(name) LIKE ?', '%' + nama_bahan + '%').first
    aliases.each do |name_alias|
      Alias.create(name: name_alias, ingredient: bahan)
    end
  end

end