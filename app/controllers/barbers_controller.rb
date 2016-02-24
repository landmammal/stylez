class BarbersController < ApplicationController
 def index
   @barbers = Barber.all
 end

 def show
   @show = Barber.all
 end
end
