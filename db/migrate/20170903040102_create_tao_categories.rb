class CreateTaoCategories < ActiveRecord::Migration[5.1]
	def change
		create_table :tao_categories do |t|
			t.string :title #标题
			t.text :desc #描述
			t.integer :user_id #上传人id
			t.integer  :position, default: 1 #权重
			t.boolean  :published, default: false #是否发布
			t.timestamps
		end
	end
end
