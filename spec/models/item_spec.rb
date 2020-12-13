require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品がうまくいかないとき' do
      it "画像は1枚ないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が無いと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が無いと登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "カテゴリーの情報が無いと登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it "カテゴリーの情報が---では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態についての情報が無いと登録できない" do
        @item.condition_id  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
      end
      it "商品の状態についての情報が---では登録できない" do
        @item.condition_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "配送料の負担についての情報が無いと登録できない" do
        @item.delivery_fee_defrayer_id  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee defrayer can't be blank", "Delivery fee defrayer is not a number")
      end
      it "配送料の負担についての情報が---では登録できない" do
        @item.delivery_fee_defrayer_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee defrayer must be other than 1")
      end
      it "発送元の地域についての情報が無いと登録できない" do
        @item.forwarder_area_id  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Forwarder area can't be blank", "Forwarder area is not a number")
      end
      it "発送元の地域についての情報が---では登録できない" do
        @item.forwarder_area_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Forwarder area must be other than 1")
      end
      it " 発送までの日数についての情報が無いと登録できない" do
        @item.sending_day_id   = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Sending day can't be blank", "Sending day is not a number")
      end
      it " 発送までの日数についての情報が---では登録できない" do
        @item.sending_day_id   = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sending day must be other than 1")
      end
      it "価格についての情報が無いと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が¥300以下では登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が¥9,999,999より大きければ登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "価格は半角数字でないと登録できない" do
        @item.price = "a"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end 
    context '商品出品がうまく行くとき' do
      it "全てが規定通りなら登録できる" do
        expect(@item).to be_valid
       end 
    end
  end
end
