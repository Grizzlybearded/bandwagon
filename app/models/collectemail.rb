class Collectemail < ActiveRecord::Base

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	validates :unsubscribe_token, presence: true

	default_scope order('created_at ASC')	

	#before_save :generate_token

	def generate_token
		self.unsubscribe_token = loop do
			random_token = SecureRandom.urlsafe_base64
			break random_token unless Collectemail.exists?(unsubscribe_token: random_token)
		end
	end

	def check_for_email
		collectemail = Collectemail.find_by_email(params[:email])
		if !collectemail.nil?
			collectemail.update_attributes(send_email: true)
		end
	end

end