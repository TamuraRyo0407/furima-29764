class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code
      t.integer :prefecture_id   
      t.string  :municipality 
      t.string  :address  
      t.string  :building_name  
      t.string  :phone_number 
      t.references :buyer ,foreign_key: true 
      t.timestamps
    end
  end
end
