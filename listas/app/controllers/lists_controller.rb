class ListsController < ApplicationController
	def new
		@list = List.new
	end
	def create
		@list = List.new(list_params)
		if @list.save
			redirect_to @list	
		else
			render 'new'
		end
		
	end
	def index
		@lists = List.all
	end

	def edit
		@list = List.find_by(url:params[:id])
	end
	
	def show
    	 @list = List.find_by(url:params[:id])

 	end
	
	def update
		@list = List.find_by(url:params[:id])
		if @list.update(list_params)
			redirect_to @list
		else
			render 'edit'
		end
	end

	def destroy
		@list = List.find_by(url:params[:id])
		@list.destroy
		redirect_to lists_path
	end

	private
	def list_params
		params.require(:list).permit(:name, :url)
	end

end
