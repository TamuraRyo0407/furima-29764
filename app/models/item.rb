class Item < ApplicationRecord
  belongs_to       :user
  has_one          :buyer
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee_defrayer
  belongs_to :forwarder_area
  belongs_to :sending_day

  with_options presence: true do
    validates :name
    validates :text 
    validates :category_id, numericality: { other_than: 1 }  
    validates :condition_id, numericality: { other_than: 1 } 
    validates :delivery_fee_defrayer_id, numericality: { other_than: 1 }  
    validates :forwarder_area_id, numericality: { other_than: 1 } 
    validates :sending_day_id, numericality: { other_than: 1 } 
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :image
  end
end