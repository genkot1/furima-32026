require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品出品' do
    context '商品出品がうまくいくとき' do
      it "各項目が入力されていれば商品出品できる" do
        expect(@item).to be_valid
      end
      it "priceが300円〜9999999円の間で出品できる" do
        price = 5000
        expect(@item).to be_valid
      end
      it "shipping_fee_idが1または2のとき出品できる" do
        shipping_fee_id = 1
        expect(@item).to be_valid
      end
      it "category_idが1~10のとき出品できる" do
        category_id = 1
        expect(@item).to be_valid
      end
      it "condition_idが1~6のとき出品できる" do
        condition_fee_id = 1
        expect(@item).to be_valid
      end
      it "prefecture_idが1~47のとき出品できる" do
        prefecture_id = 1
        expect(@item).to be_valid
      end
      it "duration_idが1~3のとき登録できる" do
        duration_id = 1
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空だと出品できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "priceが空だと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが半角数字以外だと登録できない" do
        @item.price = "一二三四五"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "priceが9999999円より高いと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが300円未満だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "shipping_fee_idが選択されていなければ出品できない" do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee Select")
      end
      it "category_idが選択されていなければ出品できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "condition_idが選択されていなければ出品できない" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end
      it "prefecture_idが選択されていなければ出品できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it "duration_idが選択されていなければ出品できない" do
        @item.duration_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Duration Select")
      end
      it "ユーザーが紐付いていないと商品を出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
