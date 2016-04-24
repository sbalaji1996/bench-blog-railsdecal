class Post < ActiveRecord::Base
	validates :sport, :title, :text, presence: true
	belongs_to :user
	has_many :comments

	def self.search(search)
	  where("sport LIKE ?", "%#{search}%") 
	  where("title LIKE ?", "%#{search}%")
	end
end
