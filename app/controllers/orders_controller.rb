class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  require 'active_merchant'
  require 'mailgun'

  def delivery

    @delivery_areas = DeliveryArea.all

    carted_dishes = []
    session[:cart].each do |carted_dish_id|
      carted_dishes << CartedDish.find_by("status = ? and id = ?", "carted", carted_dish_id)
    end  
  
    subtotal = 0
    carted_dishes.each do |carted_dish|
      subtotal += carted_dish.price * carted_dish.quantity
    end
    tax = subtotal * 0.0875
    total = (subtotal + tax).round(2)
    if total < 25
      flash[:warning] = "Sorry - There's a $25 minimum on delivery orders."
      redirect_to categories_path
    else
      render "delivery.html.erb"
    end
  end

  def new
    @carted_dishes = []
    session[:cart].each do |carted_dish_id|
      @carted_dishes << CartedDish.find_by("status = ? and id = ?", "carted", carted_dish_id)
    end  
  
    @subtotal = 0
    @carted_dishes.each do |carted_dish|
      @subtotal += carted_dish.price * carted_dish.quantity
    end
    @tax = @subtotal * 0.0875
    @total = (@subtotal + @tax).round(2)
    if params[:xShipCity]
      @total += DeliveryArea.find_by(name: params[:xShipCity]).price
    end
    @invoiceNumber = Order.last.id + 100
  end



  def create
    carted_dish_ids = eval(params[:xCustom02])
    @carted_dishes = []
    carted_dish_ids.each do |carted_dish_id|
      @carted_dishes << CartedDish.find_by("status = ? and id = ?", "carted", carted_dish_id)
    end

    if params[:xShipCity]
      order_method = "Delivery"
      delivery_address = "#{params[:xShipStreet]}, #{params[:xShipCity]}, #{params[:xShipState]}"
    else
      order_method = "Pickup"
    end
    order1 = Order.create(total: params[:xAmount], ref_num: params[:xRefNum], email: params[:xEmail], delivery_address: delivery_address, method: order_method)

    @carted_dishes.each do |carted_dish|
      carted_dish.update(status: "purchased", order_id: order1.id)
    end

    session[:cart] = []

    # Send email to the purchaser with order details using MailGun:
    RestClient.post "https://api:#{ENV['MAILGUN_API_KEY']}"\
  "@api.mailgun.net/v3/mail.chopandchillny.com/messages",
    :from => "noreply@chopandchillny.com",
    :to => order1.email,
    :subject => "Congrats on your Chop and Chill Order!",
    :html => "Here's your order info: 
    <p>Total: $#{order1.total}</p>
    <p>Reference Number: #{order1.ref_num}</p>
    <p>For more order details, click <a href='www.chopandchillny.com/orders/#{order1.id}?xRefNum=#{order1.ref_num}'>here</a></p>
    "
    render "/orders/#{order1.id}?xRefNum=#{params[:xRefNum]}"

    # flash[:success] = "Congrats! Your order has been placed!"
    # @html = "<html><body><script type='text/javascript' charset='utf-8'>window.parent.document.location.href = '/orders/#{order1.id}';</script></body></html>".html_safe
    # render inline: "<%= @html %>"
  end

  def show
    @order = Order.find(params["id"])    
    redirect_to "/categories" unless @order.ref_num == params[:xRefNum]
  end
end



