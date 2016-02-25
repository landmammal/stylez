class BarbersController < ApplicationController
  include BarbersHelper



   def index
     @barbers = Barber.all
   end

   def show
     @barber = Barber.find(params[:id])
   end

   def new
    @barber = Barber.new
   end

   def create
     @barber = Barber.new(form_params)
     if @barber.save
       redirect_to @barber, notice: 'You have succesfully register, WELCOME to STYLE'
     else
       render actions: 'new'
     end

   end

   def edit
     @barber = Barber.find(params[:id])
   end

   def update
      @barber = Barber.find(params[:id])
      @barber.update(form_params)

      redirect_to barber_path(@barber)
   end

   def destroy
       @barber = Barber.destroy(params[:id])


       redirect_to barber_path
    end
end
