class CardsController < ApplicationController
  def new
    redirect_to root_path unless current_user.card.nil?
    @card = Card.new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.create(
      description: 'test',
      card: params[:token]
    )
    @card = Card.new(
      card_token: params[:token],
      customer_token: customer.id,
      user_id: current_user.id
    )
    if @card.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end
end
