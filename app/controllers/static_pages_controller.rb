class StaticPagesController < ApplicationController
  def home
  	@email = Collectemail.new
  end
end
