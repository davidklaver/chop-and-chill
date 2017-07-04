class OrdersController < ApplicationController
  # before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  require 'active_merchant'
  require 'mailgun'

  def delivery
  #   email = "davidjklaver@gmail.com"
  #   RestClient.post "https://api:key-363879ea1d06f74b44d685f4484f33ec"\
  # "@api.mailgun.net/v3/chopandchillny.com/messages",
  #   :from => "mail.chopandchillny.com",
  #   :to => email,
  #   :subject => "Congrats on your Chop and Chill Order!",
  #   :html => "Here's your order info: "



# First, instantiate the Mailgun Client with your API key
# mg_client = Mailgun::Client.new 'key-363879ea1d06f74b44d685f4484f33ec'

# # Define your message parameters
# message_params =  { from: 'mail@chopandchillny.com',
#                     to:   'davidklaverjunk@gmail.com',
#                     subject: 'The Ruby SDK is awesome!',
#                     text:    'It is really easy to send a message!'
#                   }

# # Send your message through the client
# mg_client.send_message 'sandbox43c98faad09044ccb5cf61efc5442aa8.mailgun.org', message_params
  end

  def new
    @carted_dishes = []
    session[:cart].each do |carted_dish_id|
      @carted_dishes << CartedDish.find_by("status = ? and id = ?", "carted", carted_dish_id)
    end  
  
    @subtotal = 0
    @carted_dishes.each do |carted_dish|
      @subtotal += carted_dish.dish_subtotal * carted_dish.quantity
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
  "@api.mailgun.net/v3/mail.chopandchillny.com/messages",
    :from => "mail.chopandchillny.com",
    :to => order1.email,
    :subject => "Congrats on your Chop and Chill Order!",
    :html => "Here's your order info: 
    <p>Total: $#{order1.total}</p>
    <p>Reference Number: #{order1.ref_num}</p>
    <p>For more order details, click <a href='https://chop-and-chill.herokuapp.com/orders/#{order1.id}?xRefNum=#{order1.ref_num}'>here</a></p>
    "

    flash[:success] = "Congrats! Your order has been placed!"
    @html = "<html><body><script type='text/javascript' charset='utf-8'>window.parent.document.location.href = '/orders/#{order1.id}';</script></body></html>".html_safe
    render inline: "<%= @html %>"
  end

  def show
    @order = Order.find(params["id"])    
    redirect_to "/dishes" unless @order.ref_num == params[:xRefNum]
  end
end



