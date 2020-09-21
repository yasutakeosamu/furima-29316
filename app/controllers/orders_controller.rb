class OrdersController < ApplicationController
  before_action :item_find
  def index
    redirect_to root_path unless @item.purchase.nil?
    @purchase = PurchaseCustomer.new
    redirect_to root_path unless user_signed_in? && @item.user_id != current_user.id
  end

  def create
    @purchase = PurchaseCustomer.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:item_id, :token, :postal_code, :state, :city, :address, :building, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
