class Blurb < ActiveRecord::Base
	validates :content, presence: true, length: { maximum: 400 }

	validates :category_id, presence: true
	validates :name, presence: true

	belongs_to :category

	default_scope order('created_at DESC')
end