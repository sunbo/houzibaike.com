class KusController < ApplicationController

	def index
		@kus = Ku.published.order(id: :desc)
	end

	def new
		@ku = Ku.new
		@ku_category = KuCategory.new
	end

	def create
		@ku = Ku.new(ku_params)
		@ku.user_id = current_user.id
		@ku.save
		redirect_to @ku
	end

	def show
		@ku = Ku.find(params[:id])
	end

	def list
		@kus = Ku.all.order(id: :desc)
	end

	def edit
		@ku = Ku.find(params[:id])
		@ku_category = KuCategory.new
	end

	def update
		@ku = Ku.find(params[:id])
		@ku.update(ku_params)
		redirect_to @ku
	end

	def publish
		@record = Ku.find(params[:id])
		@record.update_attributes(published: true)
		@record.reload
		render "common/publish"
	end

	def unpublish
		@record = Ku.find(params[:id])
		@record.update_attributes(published: false)
		@record.reload
		render "common/publish"
	end

	def destroy
		@ku = Ku.find(params[:id])
		@ku.destroy
		redirect_to list_kus_path
	end

	private
	def ku_params
		params.require(:ku).permit(:category_id, :title, :title, :desc, :content, :user_id, :position, :published)
	end
end
