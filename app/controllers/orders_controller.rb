class OrdersController < ApplicationController
  before_action :item_find
  def index
    redirect_to root_path unless @item.purchase.nil?
    redirect_to user_path(current_user.id) if current_user.card.nil?
    @purchase = PurchaseCustomer.new
    redirect_to new_user_session_path unless user_signed_in? && @item.user_id != current_user.id
  end

  def create
    @purchase = PurchaseCustomer.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to item_path(@item.id)
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:item_id, :postal_code, :state, :city, :address, :building, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: @item.price,
      customer: customer_token,
      currency: 'jpy'
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
