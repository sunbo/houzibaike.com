class Pic < ApplicationRecord
	acts_as_votable
	belongs_to :user

	has_attached_file :media, styles: { large: '800x800>', middle: '300x300>', small: '100x100>' }
	validates_attachment_content_type :media, content_type: %w[image/jpeg image/jpg image/pjpeg image/png image/x-png image/gif]

	scope :published, -> { where published: true }
end
