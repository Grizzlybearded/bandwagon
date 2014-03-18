class CategoriesController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  def show
  	@categories = Category.all
  	@category = Category.find(params[:id])
  	@blurbs = @category.blurbs
  	@blurb = @category.blurbs.build
  end
end
