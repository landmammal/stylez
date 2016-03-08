class RelationshipsController < ApplicationController
  before_action :authorize_customer

  def create
    barber = @barber.find(params[:followed_id])
    current_barber.follow(barber)
    redirect_to barber
  end

  def destroy
    barber = Relationship.find(params[:id]).followed_id
    current_barber.unfollow(barber)
    redirect_to barber
  end
end
