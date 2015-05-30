class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :about]  

  def home
  	@waitemail = Waitlist.new
  	if Category.where(show_to_users: true).fifth.nil?
      @category = Category.where(show_to_users: true).first
    else
      @category = Category.where(show_to_users: true).fifth
    end

    @blurbs = @category.blurbs
  end

  def about
  end

  def test
  	list = ["team@thebandwagn.com", "marcus.gallagher@gmail.com", "martin.kleinbard@gmail.com"]
  	category_id = Category.where(show_to_users: true).first.id
  	list.each do |person|
      Resque.enqueue(MailerWorker,category_id, person, "test")
  		#NewsletterMailer.biweekly(category, person, "test").deliver
  	end
  	redirect_to Category.where(show_to_users: true).first
  end

  def eblast
    list = Collectemail.where(send_email: true)
  	category = Category.where(show_to_users: true).first
    category.update_attributes(send_date: Date.today)
  	list.each do |person|
      Resque.enqueue(MailerWorker, category.id, person.email, "real")
  		#NewsletterMailer.biweekly(category, person.email, "real").deliver
  	end
  	redirect_to category
  end

end
