class ReviewsController < ApplicationController
  before_action :find_barber
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :authorize_customer, only: [:new, :edit]

  def new
    @review = Review.new
  end

  def create

    @review = Review.new(review_params)
    @review.barber_id = @barber.id
    @review.customer_id = current_customer.id

    if @review.save

      redirect_to barber_path(@barber)
    else

      render 'new'
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to barber_path(@barber)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to barber_path(@barber)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_barber
    @barber = Barber.find(params[:barber_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

end
