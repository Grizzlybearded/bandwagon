class Category < ActiveRecord::Base
	validates :title, presence: true

	has_many :blurbs, dependent: :destroy
	default_scope order('created_at DESC')
end