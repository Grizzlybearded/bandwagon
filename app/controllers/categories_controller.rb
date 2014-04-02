class CategoriesController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]

  def show
  	@categories = Category.all
  	@category = Category.find(params[:id])
  	@blurbs = @category.blurbs
  	@blurb = @category.blurbs.build
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save
  		flash[:success] = "Email created!"
  		redirect_to @category
  	else
  		flash[:notice] = "New email no created!"
      redirect_to :back
  	end
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def update
  	@category = Category.find(params[:id])
  	if @category.update_attributes(category_params)
  		flash[:success] = "Email updated!"
  		redirect_to @category
  	else
  		flash[:notice] = "Email not updated!"
  		render 'edit'
  	end
  end

  def destroy
  	Category.find(params[:id]).destroy
  	flash[:success] = "Email destroyed!"
  	redirect_to Category.first
  end

  def index
    @categories = Category.all
  end

 private
 	def category_params
 		params.require(:category).permit(:title, :description)
 	end
end