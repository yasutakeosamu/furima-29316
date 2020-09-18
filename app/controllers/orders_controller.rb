class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path unless user_signed_in? && @item.user_id != current_user.id
  end
  def create
    
  end
end
