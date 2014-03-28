class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :about]  

  def home
  	@email = Collectemail.new
  	@first = Category.first
  end

  def about
  end

  def test
  	list = ["marcus.gallagher@gmail.com"]
  	category = Category.first
  	list.each do |person|
  		NewsletterMailer.biweekly(category, person).deliver
  	end
  	redirect_to Category.first
  end

  def eblast
  	list = Collectemail.all
  	category = Category.first
  	list.each do |person|
  		NewsletterMailer.biweekly(category, person.email).deliver
  	end

  	redirect_to Category.first
  end

end
