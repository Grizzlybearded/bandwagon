class NewsletterMailer < ActionMailer::Base
  default from: "thebandwagn@thebandwagn.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.biweekly.subject
  #
  def biweekly(category, email)
    
    @category = category
    @blurbs = category.blurbs
    @category_url = category_url(@category)
    @collect_email = Collectemail.find_by_email(email)
    @unsubscribe = unsubscribe_url(@collect_email.unsubscribe_token)

    mail to: email, subject: "TheBandwagn: " + category.title.to_s
  end
end