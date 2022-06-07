class AddIndexesToVehicles < ActiveRecord::Migration[7.0]
  def change
    # If you remove this compound index for any reason be sure to add an index on last_name
    # and first_name so we can performantly sort on that pair of columns (see note below)
    add_index :vehicles, %i[last_name first_name email vehicle_type vehicle_name length], unique: true, name: 'index_vehicles_on_all'

    # I am adding an index on vehicle_type so our sorting feature in the UI performs well
    # and doesn't tax the db more than necessary (overkill with 8 records, I know :)
    # We do not need a similar index on last_name and first_name for that sorting feature
    # because those two columns are the first two columns in the compound index above
    # (this note pretends that we're on PostgreSQL, I'm not sure if SQLite works the same way)
    add_index :vehicles, %i[vehicle_type]
  end
end
