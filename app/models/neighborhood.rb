class Neighborhood < ApplicationRecord
  has_many :complaints


  def to_hash
    RGeo::GeoJSON.encode(self.border)
  end

end
