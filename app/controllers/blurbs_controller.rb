class BlurbsController < ApplicationController

	before_filter :authenticate_user!

	def create
		@blurb = Blurb.new(blurb_params)
		if @blurb.save
			flash[:success] = "Blurb created!"
			redirect_to :back
		else
			flash[:notice] = "Blurb not created!"
			redirect_to :back
		end
	end

	def destroy
	end

private
	def blurb_params
		params.require(:blurb).permit(:content, :category_id)
	end
end
