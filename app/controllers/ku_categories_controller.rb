class KuCategoriesController < ApplicationController

	def index
		@ku_categories = KuCategory.arrange_as_array({order: 'title'})
	end

	def new
		@ku_category = KuCategory.new
	end

	def create
		@ku_category = KuCategory.new(ku_category_params)
		@ku_category.user_id = current_user.id
		@ku_category.save
		redirect_to @ku_category
	end

	def show
		@ku_category = KuCategory.find(params[:id])
	end

	def edit
		@ku_category = KuCategory.find(params[:id])
	end

	def update
		@ku_category = KuCategory.find(params[:id])
		@ku_category.update(ku_category_params)
		redirect_to @ku_category
	end

	def publish
		@record = KuCategory.find(params[:id])
		@record.update_attributes(published: true)
		@record.reload
		render "common/publish"
	end

	def unpublish
		@record = KuCategory.find(params[:id])
		@record.update_attributes(published: false)
		@record.reload
		render "common/publish"
	end

	def destroy
		@ku_category = KuCategory.find(params[:id])
		@ku_category.destroy
		redirect_to ku_categories_path
	end

	private
	def ku_category_params
		params.require(:ku_category).permit(:title, :e_title, :desc, :user_id, :parent_id, :position, :published)
	end
end
