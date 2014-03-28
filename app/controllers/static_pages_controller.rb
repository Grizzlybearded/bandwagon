class StaticPagesController < ApplicationController
  def home
  	@email = Collectemail.new
  	@first = Category.first
  end

  def about
  end
end
