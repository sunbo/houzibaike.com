class CreateExposes < ActiveRecord::Migration[5.1]
	def change
		create_table :exposes do |t|
			t.text :url #爆料网址
			t.text :desc #爆料理由
			t.integer :user_id #爆料人id
			t.timestamps
		end
	end
end
