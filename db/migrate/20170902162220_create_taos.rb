class CreateTaos < ActiveRecord::Migration[5.1]
	def change
		create_table :taos do |t|
			t.integer :category_id #分类
			t.string :title #标题
			t.integer  :price #价格
			t.boolean :baoyou, default: false #包邮？
			t.attachment :pic
			t.string :url #真实网址
			t.string :fanli_url #真实网址
			t.text :desc #描述
			t.text :content #详情
			t.integer :user_id #上传人id
			t.integer :expose_id #爆料人id
			t.integer  :position, default: 1 #权重
			t.boolean  :published, default: false #是否发布
			t.timestamps
		end
	end
end
