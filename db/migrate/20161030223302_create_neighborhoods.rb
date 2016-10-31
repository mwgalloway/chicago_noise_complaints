class CreateNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    create_table :neighborhoods do |t|
      t.string   :zip
      t.geometry :border

      t.timestamps
    end
  end
end
