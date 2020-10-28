class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  zennkaku = /\A[ぁ-んァ-ン一-龥]+\z/
  zennkaku_katakana = /\A[ァ-ン]+\z/
  with_options presence: true do
  validates :nickname
  validates :familyname,format: { with: zennkaku }
  validates :firstname,format: { with: zennkaku }
  validates :familyname_katakana,format: { with: zennkaku_katakana } 
  validates :firstname_katakana,format: { with: zennkaku_katakana }
  validates :birthday
  validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
end

end
