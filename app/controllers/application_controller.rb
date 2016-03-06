class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def current_customer
      @current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]
    end
    helper_method :current_customer

    def authorize_customer
      redirect_to '/login' unless current_customer
    end

    def current_barber
      @current_barber ||= Barber.find(session[:barber_id]) if session[:barber_id]
    end
    helper_method :current_barber

    def authorize_barber
      redirect_to '/login' unless current_barber
    end

end
