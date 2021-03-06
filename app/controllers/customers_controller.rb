class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  # before_filter :authorize_customer


  # custpomers to fallow barbers needs a bit more work remove customers from been fallow
  # def following
  #   @title = "Following"
  #   @customer  = Customer.find(params[:id])
  #   @customers = @customer.following.paginate(page: params[:page])
  #   render 'show_follow'
  # end
  #
  # def followers
  #   @title = "Followers"
  #   @customer  = Customer.find(params[:id])
  #   @customers = @customer.followers.paginate(page: params[:page])
  #   render 'show_follow'
  # end

  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        session[:customer_id] = @customer.id
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :password, :password_confirmation)
  end
end
