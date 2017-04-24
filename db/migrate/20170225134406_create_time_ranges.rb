class CreateTimeRanges < ActiveRecord::Migration
  def change
    create_table :time_ranges do |t|
      t.time :t_start
      t.time :t_end

      t.timestamps null: false
    end
  end
end
