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

complaints_file = File.read("air_pollution.json")

complaints_hash = JSON.parse(complaints_file)

complaints_hash["data"].each do |row|
  complaint = Complaint.new
  # complaint.complaint_type = row[9]
  # complaint.api_id = row[8]
  # complaint.date_filed = row[17]
  next if row[10][1].nil?
  lattitude = row[10][1]
  longitude = row[10][2]
  complaint.latlon = "POINT(#{longitude} #{lattitude})"

  Neighborhood.all.each do |neighborhood|
    complaint.neighborhood = neighborhood if neighborhood.border.contains?(complaint.latlon)
  end
  complaint.save
end
