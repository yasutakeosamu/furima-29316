class UsersController < ApplicationController
  def show
    redirect_to new_user_session_path unless user_signed_in?
    @user = User.find(current_user.id)

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)

    if card.nil?
      @card = card
    else
      customer = Payjp::Customer.retrieve(card.customer_token)
      @card = customer.cards.first
    end
  end
end
