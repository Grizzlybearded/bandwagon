class MailerWorker
@queue = :mailer_job_queue

	def self.perform(category_id, email, type)
		category = Category.find(category_id)
		user_email = Collectemail.find_by_email(email)
		NewsletterMailer.biweekly(category, user_email, type).deliver
	end
end