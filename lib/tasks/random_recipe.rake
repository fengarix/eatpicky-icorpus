namespace :db do
  desc 'random recipe for every restaurant'
  task :random_recipe => :environment do
  	Restaurant.all.each do |restaurant|
  	  10.times do
  	  	i = rand(1 + Recipe.count)
  	  	rec = Recipe.find(i)
  	  	restaurant.recipes << rec
  	  end
  	end
  end
end