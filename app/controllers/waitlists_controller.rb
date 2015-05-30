class WaitlistsController < ApplicationController
  def create
  	# check if it exists - done in the model
  	# what if someone adds their email to the waitlist
  	#
  	@realemail = Waitlist.new(waitlists_params)

  	if @realemail.save
  		flash[:success] = "You've been added to our waitlist. You should come off the main list within one week."
  		redirect_to root_path
  	else
  		flash[:notice] = "Your email was not added. Please try again."
  		redirect_to root_path
  	end
  end

  def transition
  	# run through loop of all on the waitlist
  	@waitlist = Waitlist.all
  	@newemail = Collectemail.new
  	if @waitlist != nil
	  	@waitlist.each do |w|
	  		# add to Collectemails list
	  		@newemail.email = w.waitemail
	  		@newemail.generate_token
	  		@newemail.save
	  		Waitlist.find_by_waitemail(w.waitemail).destroy
	  		# delete from the Waitlist
		end
	end
	redirect_to root_path
  end

private
	def waitlists_params
		params.require(:waitlist).permit(:waitemail)
	end
end
