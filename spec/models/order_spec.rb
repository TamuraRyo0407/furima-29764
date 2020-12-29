require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
  describe '商品購入' do
    context '商品購入がうまくいかないとき' do
      it "郵便番号が空だと登録出来ない" do
        @order.zip_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip code can't be blank")
      end
      it "郵便番号に-がないと登録出来ない" do
        @order.zip_code = "00"
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end    
      it "都道府県が空だと登録出来ない" do
        @order.prefecture_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture is not a number")
      end
      it "都道府県が--だと登録出来ない" do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "市区町村が空だと登録出来ない" do
        @order.municipality  = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it "市区町村が全角でないと登録出来ない" do
        @order.municipality  = "a"
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality is invalid. Input full-width characters.")
      end
      it "番地が空だと登録出来ない" do
        @order.address = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空だと登録出来ない" do
        @order.phone_number  = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号が半角数字でないと登録出来ない" do
        @order.phone_number  = "a"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is not a number")
      end
      it "電話番号が十二文字以上だと登録出来ない" do
        @order.phone_number  = "111111111111"
        @order.valid?
        expect(@order.errors.full_messages).to include( "Phone number is too long (maximum is 11 characters)")
      end
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空では登録できないこと" do
        @order.user_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @order.item_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

    end
    context '商品購入がうまく行くとき' do
      it "全てが規定通りなら登録できる" do
        expect(@order).to be_valid
       end 
      it "建物名が空でも登録できる" do
        @order.building_name = ""
        expect(@order).to be_valid
      end 
    end
  end 
end
