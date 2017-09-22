class PicsController < ApplicationController

	def index
		@pics = Pic.published.order(position: :desc)
	end

	def new
		@pic = Pic.new
	end

	def create
		@pic = Pic.new(pic_params)
		@pic.user_id = current_user.id
		@pic.save
		redirect_to @pic
	end

	def show
		@pic = Pic.find(params[:id])
	end

	def list
		@pics = Pic.all.order(id: :desc)
	end

	def upvote
		@pic = Pic.find(params[:id])
		@pic.upvote_by current_user
		redirect_to @pic
	end

	def downvote
		@pic = Pic.find(params[:id])
		@pic.downvote_by current_user
		redirect_to @pic
	end

	def edit
		@pic = Pic.find(params[:id])
	end

	def update
		@pic = Pic.find(params[:id])
		@pic.update(pic_params)
		redirect_to @pic
	end

	def publish
		@record = Pic.find(params[:id])
		@record.update_attributes(published: true)
		@record.reload
		render "common/publish"
	end

	def unpublish
		@record = Pic.find(params[:id])
		@record.update_attributes(published: false)
		@record.reload
		render "common/publish"
	end

	def destroy
		@pic = Pic.find(params[:id])
		@pic.destroy
		redirect_to list_pics_path
	end

	private
	def pic_params
		params.require(:pic).permit(:desc, :media, :user_id, :position, :published)
	end
end
