class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :neighborhood
      t.string :address
      t.string :postal_code
      t.float :latitude
      t.float :longitude
      t.float :stars
      t.integer :review_count
      t.string :is_open
      t.string :alcohol
      t.boolean :ambience_romantic
      t.boolean :ambience_intimate
      t.boolean :ambience_classy
      t.boolean :ambience_hipster
      t.boolean :ambience_touristy
      t.boolean :ambience_trendy
      t.boolean :ambience_upscale
      t.boolean :ambience_casual
      t.boolean :bikeParking
      t.boolean :businessAcceptsCreditCards
      t.boolean :businessParking_garage
      t.boolean :businessParking_street
      t.boolean :businessParking_validated
      t.boolean :businessParking_lot
      t.boolean :businessParking_valet
      t.boolean :caters
      t.boolean :goodForKids
      t.boolean :goodForMeal_dessert
      t.boolean :goodForMeal_latenight
      t.boolean :goodForMeal_lunch
      t.boolean :goodForMeal_dinner
      t.boolean :goodForMeal_breakfast
      t.boolean :goodForMeal_brunch
      t.boolean :hasTV
      t.string :noiseLevel
      t.boolean :open24Hours
      t.boolean :outdoorSeating
      t.string :restaurantsAttire
      t.boolean :restaurantsDelivery
      t.boolean :restaurantsGoodForGroups
      t.integer :restaurantsPriceRange2
      t.boolean :restaurantsReservations
      t.boolean :restaurantsTableService
      t.boolean :restaurantsTakeOut
      t.boolean :wheelchairAccessible
      t.string :wiFi
      t.string :categories
      t.time :hours_Monday
      t.time :hours_Tuesday
      t.time :hours_Wednesday
      t.time :hours_Thursday
      t.time :hours_Friday
      t.time :hours_Saturday
      t.time :hours_Sunday

      t.timestamps null: false
    end
  end
end
