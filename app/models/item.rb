class Item < ApplicationRecord
  belongs_to  :user
  has_one    :buyer

  with_options presence: true do
    validates :name
    validates :text 
    validates :category_id
    validates :condition_id
    validates :delivery_fee_defrayer_id 
    validates :forwarder_area_id
    validates :sending_days_id
    validates :price
    validates :user
  end
end