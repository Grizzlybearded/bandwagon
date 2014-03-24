class Blurb < ActiveRecord::Base
	validates :content, presence: true, length: { maximum: 600 }

	validates :category_id, presence: true
	validates :name, presence: true

	belongs_to :category

	default_scope order('updated_at DESC')
end