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
		@category = Blurb.find(params[:id]).category
		Blurb.find(params[:id]).destroy
		flash[:success] = "Blurb destroyed!"
		redirect_to @category
	end

	def edit
		@blurb = Blurb.find(params[:id])
	end

	def update
		@blurb = Blurb.find(params[:id])
		if @blurb.update_attributes(blurb_params)
			flash[:success] = "Blurb updated!"
			redirect_to @blurb.category
		else
			flash[:notice] = "Blurb not updated!"
			render 'edit'
		end
	end

private
	def blurb_params
		params.require(:blurb).permit(:content, :category_id, :name)
	end
end