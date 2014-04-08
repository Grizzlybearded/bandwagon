class CollectemailsController < ApplicationController

	def create
		@email = Collectemail.new(collectemails_params)
		@find_email = Collectemail.find_by_email_and_send_email(@email.email, false)
		
		if @find_email.nil?
			@email.generate_token
			if @email.save
				flash[:success] = "You'll receive our next email.  In the meantime, check out our archive!"
				redirect_to Category.first
			else
				flash[:notice] = "Your email was not added to our distribution."
				redirect_to root_path
			end
		else
			@find_email.update_attributes(send_email: true)
			flash[:success] = "You'll receive our next email.  In the meantime, check out our archive!"
			redirect_to Category.first
		end
	end

	def unsubscribe
		collectemail = Collectemail.find_by_unsubscribe_token(params[:unsubscribe_token])
		if !collectemail.nil?
			collectemail.update_attributes(send_email: false)
			render text: "You have been unsubscribed."
		else
			render text: "Invalid link."
		end
	end

private
	def collectemails_params
		params.require(:collectemail).permit(:email)
	end
end