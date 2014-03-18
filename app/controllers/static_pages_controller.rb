class StaticPagesController < ApplicationController
  def home
  	redirect_to Category.first
  end
end
