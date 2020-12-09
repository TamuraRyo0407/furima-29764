class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name 
      t.text :text
      t.integer :category_id
      t.integer :condition_id 
      t.integer :delivery_fee_defrayer_id
      t.integer :forwarder_area_id
      t.integer :sending_days_id 
      t.integer :price
      t.references :user, foreign_key: true 
      t.timestamps
    end
  end
end
