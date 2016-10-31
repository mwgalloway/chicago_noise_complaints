class Neighborhood < ApplicationRecord
  def to_hash
    RGeo::GeoJSON.encode(self.border)
  end

end
