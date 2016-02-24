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
     @barber = Barber.new (forms_params)
     @barber.save

   end

end
