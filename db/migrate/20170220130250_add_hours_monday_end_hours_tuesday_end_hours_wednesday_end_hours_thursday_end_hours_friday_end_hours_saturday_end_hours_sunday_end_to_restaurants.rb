class AddHoursMondayEndHoursTuesdayEndHoursWednesdayEndHoursThursdayEndHoursFridayEndHoursSaturdayEndHoursSundayEndToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :hours_Monday_end, :time
    add_column :restaurants, :hours_Tuesday_end, :time
    add_column :restaurants, :hours_Wednesday_end, :time
    add_column :restaurants, :hours_Thursday_end, :time
    add_column :restaurants, :hours_Friday_end, :time
    add_column :restaurants, :hours_Saturday_end, :time
    add_column :restaurants, :hours_Sunday_end, :time
  end
end
