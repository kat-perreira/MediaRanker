# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('db', 'seed_data', 'media_seeds.csv'))

csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  w = Work.new
  w.category = row['category']
  w.title = row['title']
  w.creator = row['creator']
  w.publication_year = row['publication_year']
  w.description = row['description']
  w.save
  puts "#{w.title}"
end
