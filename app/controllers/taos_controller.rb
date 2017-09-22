class TaosController < ApplicationController

	def index
		@taos = Tao.published.order(position: :desc)
	end

	def new
		@tao = Tao.new
		@tao_category = TaoCategory.new
	end

	def create
		@tao = Tao.new(tao_params)
		@tao.user_id = current_user.id
		@tao.expose_id = current_user.id if tao_params["user_id"].blank?
		@tao.save
		redirect_to @tao
	end

	def edit
		@tao = Tao.find(params[:id])
		@tao_category = TaoCategory.new
	end

	def update
		@tao = Tao.find(params[:id])
		@tao.update(tao_params)
		redirect_to @tao
	end

	def show
		@tao = Tao.find(params[:id])
	end

	def list
		@taos = Tao.all.order(id: :desc)
	end

	def publish
		@record = Tao.find(params[:id])
		@record.update_attributes(published: true)
		@record.reload
		render "common/publish"
	end

	def unpublish
		@record = Tao.find(params[:id])
		@record.update_attributes(published: false)
		@record.reload
		render "common/publish"
	end

	def destroy
		@tao = Tao.find(params[:id])
		@tao.destroy
		redirect_to list_taos_path
	end

	private
	def tao_params
		params.require(:tao).permit(:category_id, :title, :price, :baoyou, :pic, :url, :fanli_url, :title, :desc, :content, :user_id, :expose_id, :position, :published)
	end
end
