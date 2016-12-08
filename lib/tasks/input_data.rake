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
      puts element
      save(element) if !is_dryrun
    end
  end

  def save(element)
    puts 'saving...' + element["name"]
  end

end