class CreateEatingPlaces < ActiveRecord::Migration
  def change
    create_table :eating_places do |t|
      t.text "name"
      t.text "description"
      t.text "food_type"
      t.text "price_range"
      t.text "house_number"
      t.text "street_name"
      t.text "city"
      t.text "state"
      t.text "postcode"
      t.text "country"
      t.float "lat"
      t.float "lng"
      t.timestamps null: false
    end
  end
end
