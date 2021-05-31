# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

n = 2

1.upto(n) do |num|
  file = File.read("./db/data/#{num}.json")
  hash = JSON.parse(file)
  hash['description'] = hash['description'].join("\n")

  Episode.create(hash)
end

