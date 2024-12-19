# list all tables
ActiveRecord::Base.connection.tables

# list all models
Rails.application.eager_load!
ActiveRecord::Base.descendants.map(&:name)

# loop through all models and count rows
tables = ActiveRecord::Base.connection.tables
puts "Tables: #{tables.count}"

tables.each do |table|
  klass = table.classify.constantize rescue nil
  next if klass.nil?
  puts "#{table}: #{klass.count}"
end
