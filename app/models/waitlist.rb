class Waitlist < ActiveRecord::Base

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :waitemail, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

	default_scope order('created_at ASC')

end
