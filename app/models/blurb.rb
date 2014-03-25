class Blurb < ActiveRecord::Base
	validates :content, presence: true

	validates :category_id, presence: true
	validates :name, presence: true

	belongs_to :category

	default_scope order('updated_at DESC')
end
