class ExposesController < ApplicationController

	def index
		@exposes = Expose.all.order(id: :desc)
	end

	def new
		@expose = Expose.new
	end

	def create
		@expose = Expose.new(expose_params)
		@expose.url = expose_params[:url].gsub("👉手机淘宝👈","")
		@expose.desc = expose_params[:desc].gsub("👉手机淘宝👈","")
		@expose.user_id = current_user.id
		@expose.save
		redirect_to @expose
	end

	def show
		@expose = Expose.find(params[:id])
	end

	def edit
		@expose = Expose.find(params[:id])
	end

	def update
		@expose = Expose.find(params[:id])
		@expose.update(expose_params)
		redirect_to @expose
	end

	def destroy
		@expose = Expose.find(params[:id])
		@expose.destroy
		redirect_to exposes_path
	end

	def publish
		@record = Expose.find(params[:id])
		@record.update_attributes(published: true)
		@record.reload
		render "common/publish"
	end

	def unpublish
		@record = Expose.find(params[:id])
		@record.update_attributes(published: false)
		@record.reload
		render "common/publish"
	end

	private
	def expose_params
		params.require(:expose).permit(:url, :desc)
	end
end
