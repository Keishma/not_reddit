class Vote < ApplicationRecord
	belongs_to :post
	belongs_to :user
	enum direction: {down: 0, up: 1}

	validates:user_id, uniqueness: {scrope: :post_id}
end
