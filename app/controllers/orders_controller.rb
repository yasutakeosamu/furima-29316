class OrdersController < ApplicationController
  def index  
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.purchase != nil
    @purchase = PurchaseCustomer.new
    redirect_to root_path unless user_signed_in? && @item.user_id != current_user.id
  end
  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseCustomer.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:item_id, :token, :postal_code, :state, :city, :address, :building, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency:'jpy'
    )
  end
end
