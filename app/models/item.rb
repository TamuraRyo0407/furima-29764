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
    validates :image
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
  with_options presence: true , numericality: { other_than: 1 }  do
  validates :category_id
  validates :condition_id
  validates :delivery_fee_defrayer_id
  validates :forwarder_area_id
  validates :sending_day_id
  end
end