class DeleteDateFromReviews < ActiveRecord::Migration
  def change
  	remove_column :reviews, :date, :time
  end
end
