class AddAncestryToTaoCategories < ActiveRecord::Migration[5.1]
	def change
		add_column :tao_categories, :ancestry, :string
		add_index :tao_categories, :ancestry
	end
end
