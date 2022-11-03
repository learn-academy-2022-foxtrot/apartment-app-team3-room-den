class CreateApartments < ActiveRecord::Migration[7.0]
  def change
    create_table :apartments do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :manager
      t.string :email
      t.string :price
      t.integer :bedrooms
      t.integer :bathrooms
      t.string :pets
      t.text :image
      t.integer :user_id

      t.timestamps
    end
  end
end
