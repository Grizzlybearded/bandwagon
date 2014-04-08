class Category < ActiveRecord::Base
	validates :title, presence: true
	validates_inclusion_of :show_to_users, :in => [true, false]
	
	has_many :blurbs, dependent: :destroy
	default_scope order('created_at DESC')
end