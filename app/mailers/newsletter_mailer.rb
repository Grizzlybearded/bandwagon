class NewsletterMailer < ActionMailer::Base
  default from: "thebandwagn@thebandwagn.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.biweekly.subject
  #
  def biweekly
    mail to: "marcus.gallagher@gmail.com", subject: "test"
  end
end
