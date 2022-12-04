class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root, only: [:index]

  def index
    @item = Item.find(params[:item_id]) 
    @order = PurchaseRecordsDestination.new
  end

  def create
    # binding.pry
    @order = PurchaseRecordsDestination.new(purchase_records_destination_params)
      if  @order.valid?
        @order.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def purchase_records_destination_params
    params.require(:purchase_records_destination).permit( :post_code, :prefecture_id, :city, :phon_number, :building, :address).merge(user_id: current_user.id, item_id: params[:item_id])  
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

end
