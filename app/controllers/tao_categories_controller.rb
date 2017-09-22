class TaoCategoriesController < ApplicationController

	def index
		@tao_categories = TaoCategory.arrange_as_array({order: 'title'})
	end

	def new
		@tao_category = TaoCategory.new
	end

	def create
		@tao_category = TaoCategory.new(tao_category_params)
		@tao_category.user_id = current_user.id
		@tao_category.save
		redirect_to @tao_category
	end

	def show
		@tao_category = TaoCategory.find(params[:id])
	end

	def edit
		@tao_category = TaoCategory.find(params[:id])
	end

	def update
		@tao_category = TaoCategory.find(params[:id])
		@tao_category.update(tao_category_params)
		redirect_to @tao_category
	end

	def publish
		@record = TaoCategory.find(params[:id])
		@record.update_attributes(published: true)
		@record.reload
		render "common/publish"
	end

	def unpublish
		@record = TaoCategory.find(params[:id])
		@record.update_attributes(published: false)
		@record.reload
		render "common/publish"
	end

	def destroy
		@tao_category = TaoCategory.find(params[:id])
		@tao_category.destroy
		redirect_to tao_categories_path
	end

	private
	def tao_category_params
		params.require(:tao_category).permit(:title, :desc, :user_id, :parent_id, :position, :published)
	end
end
