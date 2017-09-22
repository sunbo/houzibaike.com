class Ku < ApplicationRecord
	belongs_to :user
	belongs_to :ku_category, foreign_key: "category_id"

	scope :published, -> { where published: true }
end
