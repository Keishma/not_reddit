class Post < ApplicationRecord
	has_many :comments
	has_many :votes
end
