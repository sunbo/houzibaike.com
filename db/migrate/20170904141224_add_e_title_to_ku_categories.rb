class AddETitleToKuCategories < ActiveRecord::Migration[5.1]
	def change
		add_column :ku_categories, :e_title, :string #英文名
	end
end
