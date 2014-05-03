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
  	list = ["marcus.gallagher@gmail.com", "marcus@thebandwagn.com", "martin.kleinbard@gmail.com", "martin@thebandwagn.com"]
  	category = Category.where(show_to_users: true).first
  	list.each do |person|
  		NewsletterMailer.biweekly(category, person, "test").deliver
  	end
  	redirect_to Category.where(show_to_users: true).first
  end

  def eblast
  	#list = ["marcus.gallagher@gmail.com", "thebandwagn@thebandwagn.com", "marcus@thebandwagn.com", "conductor@thebandwagn.com"]
    list = Collectemail.where(send_email: true)
  	category = Category.where(show_to_users: true).first
    category.update_attributes(send_date: Date.today)
  	list.each do |person|
  		NewsletterMailer.biweekly(category, person.email, "real").deliver
      #NewsletterMailer.biweekly(category, person, "real").deliver
      puts person
  	end

  	redirect_to category
  end

end
