class CategoriesController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]

  def show
    @category_for_email = Category.where(show_to_users: true).first

    
  	@category = Category.find_by_title(params[:id])
  	@blurbs = @category.blurbs
  	@blurb = @category.blurbs.build

    @email = Collectemail.new
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
  	@category = Category.find_by_title(params[:id])
  end

  def update
  	@category = Category.find_by_title(params[:id])
  	if @category.update_attributes(category_params)
  		flash[:success] = "Email updated!"
  		redirect_to @category
  	else
  		flash[:notice] = "Email not updated!"
  		render 'edit'
  	end
  end

  def destroy
  	Category.find_by_title(params[:id]).destroy
  	flash[:success] = "Email destroyed!"
  	redirect_to Category.first
  end

  def index
    @categories_for_users = Category.where(show_to_users: true).limit(15)
    @categories_for_mm = Category.all
  end

 private
 	def category_params
 		params.require(:category).permit(:title, :description, :show_to_users, :send_date)
 	end
end