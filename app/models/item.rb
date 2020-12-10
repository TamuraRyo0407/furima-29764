class Item < ApplicationRecord
  belongs_to       :user
  has_one          :buyer
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee_defrayer
  belongs_to :forwarder_area
  belongs_to :sending_days

  with_options presence: true do
    validates :name
    validates :text 
    validates :category_id, numericality: { other_than: 1 }  
    validates :condition_id, numericality: { other_than: 1 } 
    validates :delivery_fee_defrayer_id, numericality: { other_than: 1 }  
    validates :forwarder_area_id, numericality: { other_than: 1 } 
    validates :sending_day_id, numericality: { other_than: 1 } 
    validates :price
    validates :user
    validates :image
  end
end