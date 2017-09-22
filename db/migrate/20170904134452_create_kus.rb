class CreateKus < ActiveRecord::Migration[5.1]
	def change
		create_table :kus do |t|
			t.integer :category_id #分类
			t.string :title #标题
			t.text :desc #描述
			t.longtext :content #详情
			t.integer :user_id #上传人id
			t.integer  :position, default: 1 #权重
			t.boolean  :published, default: false #是否发布
			t.timestamps
		end
	end
end
