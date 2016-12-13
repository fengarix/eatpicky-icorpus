namespace :db do
	desc 'initialize data'
  	task :init_data => :environment do
      puts '=== prepare database ==='
  		Rake::Task["db:drop"].invoke
      Rake::Task["db:create"].invoke
      Rake::Task["db:migrate"].invoke
      puts '=== input data ==='
      puts 'recipe'
      Rake::Task["db:input_recipe"].invoke
      puts 'aliases'
      Rake::Task["db:alias_ingredient"].invoke
      puts 'restaurant'
      Rake::Task["db:input_restaurant"].invoke
      puts 'link restaurant to recipe'
      Rake::Task["db:random_recipe"].invoke
  	end
end