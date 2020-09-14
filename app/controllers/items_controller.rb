class ItemsController < ApplicationController
  def index
  end
  def new
    unless user_signed_in?
      redirect_to root_path
    end
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :fee_id, :from_id, :day_id, :price ).merge(user_id: current_user.id)
  end
end
