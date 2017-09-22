class Tao < ApplicationRecord
	belongs_to :user
	belongs_to :tao_category, foreign_key: "category_id"

	has_attached_file :pic, styles: { large: '800x800>', middle: '300x300>', small: '100x100>' }
	validates_attachment_content_type :pic, content_type: %w[image/jpeg image/jpg image/pjpeg image/png image/x-png image/gif]

	scope :published, -> { where published: true }
end
