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

# I18n locale
ActiveModel::Error.generate_message 'title', 'blank', Book.new, {}
ActiveModel::Error.full_message 'title', 'blank', Book.new
I18n.translate 'errors.template.header', model: 'Book', count: 1
I18n.translate 'errors.template.header', model: 'Book', count: 4
I18n.translate 'actions.confirm_destroy', model: 'Book', count: 4
