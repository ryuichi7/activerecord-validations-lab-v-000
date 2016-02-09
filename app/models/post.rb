class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: %w(Fiction Non-fiction)}
	validate :click_bait

	def click_bait
		if !title.nil? && !title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
			errors.add(:title, "Must be a clickbait-y title")
		end
	end
	
end
