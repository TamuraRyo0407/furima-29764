class Buyer < ApplicationRecord
  has_one :addresse         
  belongs_to :item
end