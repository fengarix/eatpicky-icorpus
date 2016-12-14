namespace :db do
  desc 'random recipe for every restaurant'
  task :random_recipe => :environment do
  	Restaurant.all.each do |restaurant|
      puts "link restaurant #{restaurant.name}"
  	  10.times do
  	  	i = rand(1..Recipe.last.id)
  	  	rec = Recipe.find(i)
        while restaurant.recipes.include? rec
          i = rand(1..Recipe.last.id)
          rec = Recipe.find(i)
        end
  	  	restaurant.recipes << rec
  	  end
  	end
  end
end