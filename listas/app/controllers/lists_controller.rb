class ListsController < ApplicationController

	def index
		set_cookies
		
		@lists = List.where(url: cookies[:list].split(","))
		#@lists = List.all
		#render 'new'
	end


	def show
    	@list = List.find_by(url:params[:id])
	end

	def new
		@list = List.new
		set_cookies
		@cookies = cookies[:list].split(",")
	end

	def edit
		@list = List.find_by(url:params[:id])
	end


	def create
		@list = List.new(list_params)
		if @list.save
			insert_into_cookie @list
			redirect_to @list	
		else
			render 'new'
		end
		
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
		delete_from_cookie(@list)
		@list.destroy

		redirect_to lists_path
	end


	private
		def set_cookies
			cookies[:list] ||= ""
		end

		def insert_into_cookie(list)	
			@arrayCookie = cookies[:list].split(",")
			@arrayCookie << list.url
			@arrayCookie = @arrayCookie.last(5)
			cookies[:list] = @arrayCookie.join(",")
			
		end

		def delete_from_cookie(list)
			@arrayCookie = cookies[:list].split(",")
			@arrayCookie.delete(list.url)
			cookies[:list] = @arrayCookie.join(",")
		end

		def list_params
			params.require(:list).permit(:name, :url)
		end

end
