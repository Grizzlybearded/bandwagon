class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :about]  

  def home
  	@email = Collectemail.new
  	@category = Category.where(show_to_users: true).first
    @blurbs = @category.blurbs
  end

  def about
  end

  def test
  	list = ["andrea.kleinbard@gmail.com"]
  	category = Category.where(show_to_users: true).first
  	list.each do |person|
  		NewsletterMailer.biweekly(category, person).deliver
  	end
  	redirect_to Category.where(show_to_users: true).first
  end

  def eblast
  	list = Collectemail.where(send_email: true)
  	category = Category.where(show_to_users: true).first
    category.update_attributes(send_date: Date.today)
  	list.each do |person|
  		NewsletterMailer.biweekly(category, person.email).deliver
  	end

  	redirect_to Category.where(show_to_users:true).first
  end

end
