class AddAverageStarsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :average_stars, :float
  end
end
