class Order
  include ActiveModel::Model
  attr_accessor :user_id ,:item_id,:zip_code,:prefecture_id,:municipality ,:address,:building_name ,:phone_number ,:hoge,:token
  zennkaku = /\A[ぁ-んァ-ン一-龥]+\z/

  with_options presence: true do
    validates :zip_code,format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: {other_than: 1 } 
    validates :municipality,format: { with: zennkaku, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone_number,numericality: {only_integer: true},length: { maximum: 11 }
  end  
  def save
    buyer = Buyer.create(user_id: user_id,item_id: item_id)
    addresse = Addresse.create(zip_code: zip_code,prefecture_id: prefecture_id,municipality: municipality,address:address, building_name:building_name,phone_number: phone_number,buyer_id: buyer.id)
  end
end