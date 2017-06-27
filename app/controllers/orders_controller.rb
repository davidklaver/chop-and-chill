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
    @carted_dishes = []
    carted_dish_ids.each do |carted_dish_id|
      @carted_dishes << CartedDish.find_by("status = ? and id = ?", "carted", carted_dish_id)
    end
    
    order1 = Order.create(total: params[:xAmount], ref_num: params[:xRefNum], email: params[:xEmail])

    @carted_dishes.each do |carted_dish|
      carted_dish.update(status: "purchased", order_id: order1.id)
    end

    session[:cart] = []

    # Send email to the purchaser with order details using MailGun:
    RestClient.post "https://api:key-363879ea1d06f74b44d685f4484f33ec"\
    "@api.mailgun.net/v3/sandbox43c98faad09044ccb5cf61efc5442aa8.mailgun.org/messages",
    # :from => "Chop and Chill <chop-and-chill.herokuapp.com>",
    :from => "Mailgun Sandbox <postmaster@sandbox43c98faad09044ccb5cf61efc5442aa8.mailgun.org>",
    :to => "David Klaver <davidjklaver@gmail.com>",
    :subject => "Congrats on your Chop and Chill Order!",
    :html => "Here's your order info: 
    <p>Total: $#{order1.total}</p>
    <p>Reference Number: #{order1.ref_num}</p>
    <p>For more order details, click <a href='https//www.chop-and-chill.herokuapp.com/orders/#{order1.id}'>here</a></p>
    "

    flash[:success] = "Congrats! Your order has been placed!"
    @html = "<html><body><script type='text/javascript' charset='utf-8'>window.parent.document.location.href = '/orders/#{order1.id}';</script></body></html>".html_safe
    render inline: "<%= @html %>"
  end

  def show
    @order = Order.find(params["id"])    
    # redirect_to "/dishes" unless @order.ref_num == params[:xRefNum]
  end
end



