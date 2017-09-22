class KuCategory < ApplicationRecord
	include Tree
	belongs_to :user

	scope :published, -> { where published: true }
end
