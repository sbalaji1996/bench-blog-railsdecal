class Post < ActiveRecord::Base
	validates :sport, :title, :text, presence: true
	belongs_to :user
	has_many :comments
end
