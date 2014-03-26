class NewsletterMailer < ActionMailer::Base
  default from: "TheBandwagn@thebandwagn.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.biweekly.subject
  #
  def biweekly(category)
    
    @category = category
    @blurbs = category.blurbs

    mail to: "marcus.gallagher@gmail.com", subject: "test"
  end
end