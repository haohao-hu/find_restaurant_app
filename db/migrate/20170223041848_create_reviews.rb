class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.float :stars
      t.time :date
      t.text :text
      t.references :user, index: true
      t.references :restaurant, index: true

      t.timestamps null: false
    end
    add_foreign_key :reviews, :users
    add_foreign_key :reviews, :restaurants
    add_index :reviews, [:user_id, :restaurant_id, :created_at]
  end
end
