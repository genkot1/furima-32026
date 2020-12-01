require 'rails_helper'

RSpec.describe PurchaseItem, type: :model do
  before do
    @purchase_item = FactoryBot.build(:purchase_item)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'すべての情報が正しく入力されていると商品が購入できる' do
        expect(@purchase_item).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it 'tokenが空では購入できない' do
        @purchase_item.token = nil
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では購入できない' do
        @purchase_item.postal_code = nil
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンが入っていなければ購入できない' do
        @purchase_item.postal_code = '0234567'
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include("Postal code Input correctly")
      end
      it '都道府県が選択されていなければ購入できない' do
        @purchase_item.prefecture_id = 0
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include("Prefecture Select")
      end
      it '市区町村が入力されていなければ購入できない' do
        @purchase_item.city = nil
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include("City can't be blank")
      end
      it '番地が入力されていなければ購入できない' do
        @purchase_item.house_number = nil
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が入力されていなければ購入できない' do
        @purchase_item.phone_number = nil
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンが入っていると購入できない' do
        @purchase_item.phone_number = "03-12345678"
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end
