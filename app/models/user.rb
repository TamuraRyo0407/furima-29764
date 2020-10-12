class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :familyname, presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :firstname, presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :familyname_katakana, presence: true,format: { with: /\A[ァ-ン]+\z/ } 
  validates :firstname_katakana, presence: true,format: { with: /\A[ァ-ン]+\z/ }
  validates :birthday, presence: true
  validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }


end
