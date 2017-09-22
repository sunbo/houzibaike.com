class CreatePics < ActiveRecord::Migration[5.1]
	def change
		create_table :pics do |t|
			t.text :desc #描述
			t.attachment :media #图片（jpg gif），视频
			t.integer :user_id #上传人id
			t.integer  :position, default: 1 #权重
			t.boolean  :published, default: false #是否发布
			t.timestamps
		end
	end
end
