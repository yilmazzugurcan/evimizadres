class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :device_type
      t.string :identifier
      t.string :region_name
      t.string :city_name
      t.string :disctrict_name
      t.string :street_name
      t.string :entry_num
      t.string :house_num

      t.timestamps
    end
  end
end
