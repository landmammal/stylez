class SessionsController < ApplicationController

  def create_shop
     shop = Shop.find_by_email(params[:email])

     if shop && shop.authenticate(params[:password])
       session[:shop_id] = admin.id
       redirect_to '/'
     else
       redirect_to '/login'
     end
   end

   def destroy_shop
     session[:shop_id] = nil
     redirect_to '/login'
   end

  def create_customer
     customer = Customer.find_by_email(params[:email])

     if customer && customer.authenticate(params[:password])
       session[:customer_id] = customer.id
       redirect_to '/'
     else
       redirect_to '/login'
     end
   end

   def destroy_admin
     session[:customer_id] = nil
     redirect_to '/login'
   end



   def create_barber
      barber = Barber.find_by_email(params[:email])
      if barber && barber.authenticate(params[:password])
        session[:barber_id] = barber.id
        redirect_to '/'
      else
        redirect_to '/login'
      end
    end

    def destroy_barber
      session[:barber_id] = nil
      redirect_to '/login'
    end
 end
