class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :vehicle_type
      t.string :vehicle_name
      t.string :length

      t.timestamps
    end
  end
end
