class PagesController < ApplicationController
	def index
		p "***********"
		p Rails.configuration
		p "***********"
		@current_page = "index"
		@categories = Category.all
		@dishes = Dish.all
	end

	def contact_form
		RestClient.post "https://api:#{ENV['MAILGUN_API_KEY']}"\
  "@api.mailgun.net/v3/mail.chopandchillny.com/messages",
    :from => "contact_form@chopandchillny.com",
    :to => "chopandchillny@gmail.com",
    :subject => "New message from Chop and Chill Contact Form",
    :html => "<p>Name: #{params[:name]}</p>
    					<p>Email: #{params[:email]}</p>
    					<p>Message: #{params[:message]}</p>"
    flash[:success] = "Your message has been sent!"
		redirect_to pages_path
	end
end
