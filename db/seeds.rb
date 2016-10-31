# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


chicago_file = File.read("chicagozip.geojson")

chicago_hash = JSON.parse(chicago_file)

chicago_hash["features"].each do |feature|
  neighborhood = Neighborhood.new
  neighborhood.zip = feature["properties"]["zip"]
  r_neighborhood = RGeo::GeoJSON.decode(feature)

  neighborhood.border = r_neighborhood.geometry.as_text
  neighborhood.save
end
