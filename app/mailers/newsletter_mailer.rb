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

    mail to: email, subject: "TheBandwagn: " + category.title.to_s
  end
end