class CreateComplaints < ActiveRecord::Migration[5.0]
  def change
    create_table :complaints do |t|
      t.st_point :latlon
      # t.integer  :api_id
      t.integer  :neighborhood_id

      t.timestamps
    end
  end
end
