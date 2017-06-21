class OrdersController < ApplicationController
  # before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token
  require 'active_merchant'

  def new
    # p "*" * 50
    # p "here's the session cart in new:"
    # p session[:cart]
    # p "*" * 50
    @carted_dishes = []
    session[:cart].each do |carted_dish_id|
      @carted_dishes << CartedDish.find_by("status = ? and id = ?", "carted", carted_dish_id)
    end  
    # session[:cart] = []
    # @carted_dishes.each do |carted_dish|
    #   session[:cart] << carted_dish.id
    # end

    # p "*" * 50
    # p "here's the session_cart"
    # p session[:cart]
    # p "*" * 50
    @subtotal = 0
    @carted_dishes.each do |carted_dish|
      @subtotal += carted_dish.dish_subtotal
    end
    @tax = @subtotal * 0.0875
    @total = (@subtotal + @tax).round(2)
  end

    def send_simple_message
      RestClient.post "https://api:key-363879ea1d06f74b44d685f4484f33ec"\
        "@api.mailgun.net/v3/sandbox43c98faad09044ccb5cf61efc5442aa8.mailgun.org/messages",
        :from => "Mailgun Sandbox <postmaster@sandbox43c98faad09044ccb5cf61efc5442aa8.mailgun.org>",
        :to => "David Klaver <davidjklaver@gmail.com>",
        :subject => "Hello David Klaver",
        :text => "Congratulations David Klaver, you just sent an email with Mailgun!  You are truly awesome!"
  end

  def show
    send_simple_message
  end

  def delivery
    
  end

  def create
    p "*" * 50
    p "It worked!"
    p "*" * 50
    
    p "*" * 50
    p "here's the session cart in create:"
    p session[:cart]
    p "*" * 50

    @carted_dishes = []
    session[:cart].each do |carted_dish_id|
      @carted_dishes << CartedDish.find_by("status = ? and id = ?", "carted", carted_dish_id)
    end
    # @carted_dishes = CartedDish.where("status = ? and session_id = ?", "carted", session.id)
    # @subtotal = 0
    
    # @carted_dishes.each do |carted_dish|
    #   @subtotal += carted_dish.dish_subtotal
    # end
    
    # @tax = @subtotal * 0.0875
    # @total = @subtotal + @tax
  
    # order1 = Order.create(user_id: current_user.id)

    # # iii) Modify all the rows from the carted_dishes table so that their status changes to “purchased” and that they are given the appropriate order_id.

    @carted_dishes.each do |carted_dish|
      carted_dish.update(status: "purchased")
    end

    # order1.update(subtotal: order1.order_subtotal, tax: order1.order_tax, total: order1.order_total)

    flash[:success] = "Your order has been placed!"
    # redirect_to "/orders/#{order1.id}"       
    redirect_to "/categories"       
  end

  def show
    @order = Order.find(params["id"])
    redirect_to "/dishes" unless current_user.admin || current_user.id == @order.user_id
  end
end



