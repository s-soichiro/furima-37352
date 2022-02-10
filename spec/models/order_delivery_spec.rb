require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    @order = FactoryBot.build(:order_delivery)
  end

  describe '商品購入' do
    context '購入できる場合' do
      it "必要な項目全てが存在すれば登録できる" do
        expect(@order).to be_valid
      end
      it "建物名がなくても登録できる" do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end
    context '購入できない場合' do
      it "tokenがなければ登録できない" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "post_codeが空では登録できない" do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it "post_codeが正しくないと登録できない" do
        @order.post_code = '1231233'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "prefectures_idが1では登録できない" do
        @order.prefectures_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefectures can't be blank")
      end
      it "municipalitiesが空では登録できない" do
        @order.municipalities = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "adressが空では登録できない" do
        @order.adress = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Adress can't be blank")
      end
      it "tel_numが空では登録できない" do
        @order.tel_num = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel num can't be blank")
      end
      it "tel_numが文字列では登録できない" do
        @order.tel_num = "ああああああああああ"
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel num is invalid. Input only number")
      end
      it "tel_numが範囲外では登録できない" do
        @order.tel_num = "12231"
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel num Input Within range")
      end      
    end
  end


end
