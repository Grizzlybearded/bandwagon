class CollectemailsController < ApplicationController

	def create
		@email = Collectemail.new(collectemails_params)
		if @email.save
			flash[:success] = "You'll receive our next email.  In the meantime, check out our archive!"
			redirect_to Category.first
		else
			flash[:notice] = "You're email was not added to our distribution."
			redirect_to root_path
		end
	end

private
	def collectemails_params
		params.require(:collectemail).permit(:email)
	end
end