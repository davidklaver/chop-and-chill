class OrdersController < ApplicationController
  # before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  require 'active_merchant'


  def delivery
    
  end

  def new
    @carted_dishes = []
    session[:cart].each do |carted_dish_id|
      @carted_dishes << CartedDish.find_by("status = ? and id = ?", "carted", carted_dish_id)
    end  
  
    @subtotal = 0
    @carted_dishes.each do |carted_dish|
      @subtotal += carted_dish.dish_subtotal
    end
    @tax = @subtotal * 0.0875
    @total = (@subtotal + @tax).round(2)
    @invoiceNumber = Order.last.id + 100
  end



  def create
    carted_dish_ids = eval(params[:xCustom02])
    p "*" * 50
    p "here's carted_dish_ids:"
    p carted_dish_ids
    p "*" * 50

    @carted_dishes = []
    carted_dish_ids.each do |carted_dish_id|
      @carted_dishes << CartedDish.find_by("status = ? and id = ?", "carted", carted_dish_id)
    end
    
    order1 = Order.create(total: params[:xAmount])

    p "*" * 50
    p "here's order1 as of now:"
    p order1
    p "and here's @carted_dishes:"
    p @carted_dishes
    p "*" * 50

    @carted_dishes.each do |carted_dish|
      carted_dish.update(status: "purchased", order_id: order1.id)
    end

    # session[:cart] = []
    reset_session

    p "*" * 50
    p "we got to part 3! Yay!"
    p session[:cart]
    p "*" * 50

    # Send email to the purchaser with order details using MailGun:
    RestClient.post "https://api:key-363879ea1d06f74b44d685f4484f33ec"\
    "@api.mailgun.net/v3/sandbox43c98faad09044ccb5cf61efc5442aa8.mailgun.org/messages",
    # :from => "Chop and Chill <chop-and-chill.herokuapp.com>",
    :from => "Mailgun Sandbox <postmaster@sandbox43c98faad09044ccb5cf61efc5442aa8.mailgun.org>",
    :to => "David Klaver <davidjklaver@gmail.com>",
    :subject => "Congrats on your Chop and Chill Order!",
    :text => "Here's your order info: <p>Total: #{order1.total}</p>"  
  end

  def show
    @order = Order.find(params["id"])
    redirect_to "/dishes" unless current_user.admin || current_user.id == @order.user_id
  end
end



