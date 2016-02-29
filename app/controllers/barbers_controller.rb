class BarbersController < ApplicationController
  before_action :set_barber, only: [:show, :edit, :update, :destroy]
  before_action :set_shop, only: [:create, :new]
  # GET /barbers
  # GET /barbers.json
  def index
    # you get that specific shop by params(params[:shop_id])
    shop = Shop.find(params[:shop_id])
    # get all the barbers of this shop
    @barbers = shop.barbers
    barber = @barbers.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @barbers }
    end
  end

  # GET /shop/:shop_id/barbers/:id
  # GET /barbers/:id.json
  def show
    # you get that specific shop by params(params[:shop_id])
    shop = Shop.find(params[:shop_id])
    # get all the barbers of this shop
    @barbers = shop.barbers.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @barbers }
    end
  end

  # GET /barbers/new
  def new
    #1st you retrieve the shop thanks to params[:post_id]

    #2nd you build a new one
    @barber = Barber.new


  end

  # GET /barbers/1/edit
  def edit
    #1st you retrieve the post thanks to params[:post_id]
    shop = Shop.find(params[:shop_id])
    #2nd you retrieve the comment thanks to params[:id]
    @barber = shop.barbers.find(params[:id])
  end

  # POST /barbers
  # POST /barbers.json
  def create


    #2nd you create the comment with arguments in params[:comment]
    @barber = @shop.barbers.new(barber_params)

    respond_to do |format|
      if @barber.save
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

  # PATCH/PUT /barbers/1
  # PATCH/PUT /barbers/1.json
  def update
    #1st you retrieve the post thanks to params[:post_id]
    shop = Shop.find(params[:shop_id])
    #2nd you retrieve the comment thanks to params[:id]
    @barber = shop.barbers.find(params[:id])

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

  # DELETE /barbers/1
  # DELETE /barbers/1.json
  def destroy
    #1st you retrieve the post thanks to params[:post_id]
   shop = Shop.find(params[:shop_id])
   #2nd you retrieve the comment thanks to params[:id]
   @barber = shop.barbers.find(params[:id])
   @barber.destroy

   respond_to do |format|
     #1st argument reference the path /posts/:post_id/comments/
     format.html { redirect_to(shop_barbers_url) }
     format.xml  { head :ok }
   end
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_barber
      @barber = Barber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barber_params
      params.require(:barber).permit(:name, :phone, :photo, :avatar, :instagram, :shop_id)
    end
end
