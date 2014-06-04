class NewsletterMailer < ActionMailer::Base
  require 'mail'
  #include Rails.application.routes.url_helpers

  address = Mail::Address.new "thebandwagn@thebandwagn.com"
  address.display_name = "TheBandwagn"

  default from: address.format


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.biweekly.subject
  #
  def biweekly(category, user_email, type)

    @category = category
    @blurbs = @category.blurbs
    @category_url = category_url(@category)
    @collect_email = user_email
    @unsubscribe = unsubscribe_url(@collect_email.unsubscribe_token)
    @home_url = root_url

    attachments.inline['fans-losing-it2.png'] = File.read('app/assets/images/fans-losing-it2.png')
    
    if type == "test"
      @type = "[test]"
    else
      @type = ""
    end

    mail to: user_email.email, subject: "#{@type}TheBandwagn: " + @category.title.to_s
  end
end