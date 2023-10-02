class CreateCitizens < ActiveRecord::Migration[7.0]
  def change
    create_table :citizens do |t|
      t.string :phone
      t.string :intercom_uuid
      t.string :first_name

      t.timestamps
    end
  end
end
