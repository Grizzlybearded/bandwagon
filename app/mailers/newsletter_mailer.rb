class NewsletterMailer < ActionMailer::Base
  require 'mail'
  #include Rails.application.routes.url_helpers

  address = Mail::Address.new "thebandwagn@thebandwagn.com"
  address.display_name = "theBandwagn"

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

    attachments.inline['white-writing.png'] = File.read(Rails.root.join('app/assets/images/white-writing.png'))
    
    if type == "test"
      @type = "[test]"
    else
      @type = ""
    end

    mail to: user_email.email, subject: "#{@type}theBandwagn: " + @category.title.to_s
  end
end