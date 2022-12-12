require 'rails_helper'

RSpec.describe PurchaseRecord, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:purchase_records_destination, user_id: user.id, item_id: item.id)
    sleep 0.05
  end

  describe '商品購入' do
    context '住所が保存できる時' do
      it '項目を全て入力すれば保存できる' do
        expect(@order).to be_valid
      end

      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @order.post_code = '123-4567'
        expect(@order).to be_valid
      end

      it '建物がからでも保存できる' do
        @order.building = nil
        expect(@order).to be_valid
      end
    end

    context '配送情報が保存できない時' do
      it '郵便番号が空では保存できない' do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号にハイフンがなければ保存できない' do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '郵便番号のハイフンの位置が123-4567以外である場合保存できない' do
        @order.post_code = '12345-67'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'cityが空の場合は保存できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'prefecture_idが空の場合は保存できない' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが"---""0"の場合は登録できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'adressが空の場合は保存できない' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it 'phon_numberが空の場合は保存できない' do
        @order.phon_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phon number can't be blank")
      end

      it 'phon_numberにハイフンが入ると登録できない' do
        @order.phon_number = 123 - 2222 - 2222
        @order.valid?
        expect(@order.errors.full_messages).to include('Phon number is invalid')
      end

      it '電話番号が9桁以下だと登録できない' do
        @order.phon_number = 123_456_789
        @order.valid?
        expect(@order.errors.full_messages).to include('Phon number is invalid')
      end

      it '電話番号が12桁以上だと登録できない' do
        @order.phon_number = 123_456_789_012
        @order.valid?
        expect(@order.errors.full_messages).to include('Phon number is invalid')
      end

      it 'tokenが空の場合は保存できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_id（購入者）が空だと購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_id（購入者）が空だと購入できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

# bundle exec rspec spec/models/purchase_records_destination_spec.rb
