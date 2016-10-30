class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.st_point :latlon, :geographic => true, :srid => 4326

      t.timestamps
    end
  end
end
