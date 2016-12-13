require 'tri_gram_generator.rb'

namespace :db do

  desc 'reading json file and saving it to database'
  task :input_restaurant => :environment do |t, args|
    filename = 'restaurant.json'
    json_restaurant(false, filename)
  end

  desc 'testing if reading json file success'
  task :input_dryrun_restaurant => :environment do |t, args|
    _, filename = ARGV
    filename = 'restaurant.json' if !filename
    json(true, filename)
    exit
  end

  def json_restaurant(is_dryrun, filename)
    file = File.read(Rails.root.join(filename))
    data = JSON.parse(file)
    data.each do |element|
      puts "save restaurant #{element["Nama Restoran"]}"
      save_restaurant(element) if !is_dryrun
    end
  end

  def save_restaurant(element)
    Restaurant.create(name: element["Nama Restoran"], rating: element["Rating"], location: element["Lokasi"])
  end
end