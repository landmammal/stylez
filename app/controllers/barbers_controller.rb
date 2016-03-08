class BarbersController < ApplicationController
  before_action :set_barber, only: [:show, :edit, :update, :destroy]
  before_action :set_shop, only: [:create, :new, :index, :update]
  # needs log in to show
  # before_action :authorize_customer, only: [:show]
  # before_action :authorize_barber


  def following
    @title = "Following"
    @barber  = Barber.find(params[:id])
    @barbers = @barber.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @barber  = Barber.find(params[:id])
    @barbers = @barber.followers.paginate(page: params[:page])
    render 'show_follow'
  end


  def index
    # get all the barbers of this shop
    @barbers = @shop.barbers
  end

  def show
    @shop = @barber.shop
    # @instagram = Instagram.user_recent_media("2917432745", {:count => 20})
    # you get that specific shop by params(params[:shop_id])

    # get all the barbers of this shop
    # @barbers = @shop.barbers
    # .find(params[:id])if @book.reviews.blank?
    if @barber.reviews.blank?
      @average_review = 0
    else
      @average_review = @barber.reviews.average(:rating).round(2)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @barbers }
    end

  end


  def new
    @barber = Barber.new
  end

  def edit
    #2nd you retrieve the comment thanks to params[:id]
    @barber = @shop.barbers.find(params[:id])
  end

  def create
    #2nd you create the comment with arguments in params[:comment]
    @barber = @shop.barbers.new(barber_params)

    respond_to do |format|
      if @barber.save
        session[:barber_id] = @barber.id
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to root_path, :notice => 'profile created.' }
        #the key :location is associated to an array in order to build the correct route to the nested resource comment
        format.xml  { render :xml => @barber, :status => :created, :location => [@barber.shop, @barber] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @barber.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    #2nd you retrieve the comment thanks to params[:id]
    @barber = @shop.barbers.find(params[:id])

    respond_to do |format|
      if @barber.update_attributes(params[:barber])
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@barber.post, @barber], :notice => 'barber was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @barber.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    #2nd you retrieve the comment thanks to params[:id]
    @shop = @barber.shop
    @barber.destroy
    destroy_barber
    #  respond_to do |format|
    #    #1st argument reference the path /posts/:post_id/comments/
    #    format.html { redirect_to root_path}
    #    format.xml  { head :ok }
    #  end
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
  # Use callbacks to share common setup between action
  def set_barber
    @barber = Barber.find(params[:id])
  end

  def barber_params
    params.require(:barber).permit(:name, :phone, :photo, :avatar, :instagram, :shop_id, :email, :password, :password_confirmation)
  end

  def destroy_barber
    session[:barber_id] = nil
    redirect_to '/login'
  end
end
