class BarbersController < ApplicationController



   def index
     @barbers = Barber.all
   end

   def show
     @barber = Barber.all
   end

   def new
    @barber = Barber.new
   end

end
