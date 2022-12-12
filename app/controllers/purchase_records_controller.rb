class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root, only: [:index, :create]

  def index
    @order = PurchaseRecordsDestination.new
  end

  def create
    @order = PurchaseRecordsDestination.new(purchase_records_destination_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_records_destination_params
    params.require(:purchase_records_destination).permit(:post_code, :prefecture_id, :city, :phon_number, :building, :address).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    return unless @item.user_id == current_user.id || @item.purchase_record.present?

    redirect_to root_path
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,                                  # 商品の値段
      card: purchase_records_destination_params[:token],    # カードトークン
      currency: 'jpy'                                       # 通貨の種類（日本円）
    )
  end
end
