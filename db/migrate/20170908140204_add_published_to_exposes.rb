class AddPublishedToExposes < ActiveRecord::Migration[5.1]
	def change
		add_column :exposes, :published, :boolean, default: false
	end
end
