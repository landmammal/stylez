class SessionsController < ApplicationController


  def create_customer
     customer = Customer.find_by_email(params[:email])
     # If the user exists AND the password entered is correct.
     if customer && customer.authenticate(params[:password])
       # Save the user id inside the browser cookie. This is how we keep the user
       # logged in when they navigate around our website.
       session[:customer_id] = customer.id
       redirect_to '/'
     else
     # If user's login doesn't work, send them back to the login form.
       redirect_to '/login'
     end
   end

   def destroy_customer
     session[:customer_id] = nil
     redirect_to '/login'
   end

   def create_barber
      barber = Barber.find_by_email(params[:email])
      # If the user exists AND the password entered is correct.
      if barber && barber.authenticate(params[:password])
        # Save the user id inside the browser cookie. This is how we keep the user
        # logged in when they navigate around our website.
        session[:barber_id] = barber.id
        redirect_to '/'
      else
      # If user's login doesn't work, send them back to the login form.
        redirect_to '/login'
      end
    end

    def destroy_barber
      session[:barber_id] = nil
      redirect_to '/login'
    end
 end
