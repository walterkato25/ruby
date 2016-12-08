class ListsController < ApplicationController
	before_action :set_cookies
	def index
		#@lists = List.all
		cookies[:list_url].each do |url|
			@lists = List.find_by(url:url)
		end
	end


	def show
    	@list = List.find_by(url:params[:id])
	end

	def new
		@list = List.new
	end

	def edit
		@list = List.find_by(url:params[:id])
	end


	def create
		@list = List.new(list_params)
		if @list.save
			insert_into_cookie @list.url
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
		#@list = List.find_by(url:params[:id])
		@list.destroy
		redirect_to lists_path
	end


	private
		def set_cookies
			if cookies[:list_url].nil?
				cookies[:list_url]=Hash.new
			end
		end
		def insert_into_cookie(url)
			cookies[:list_url].split(",") << url
			cookies[:list_url] = cookie[:'list_url'].last(5)
			cookies[:list_url] = array_to_string cookies[:'list_url']
		end

		def list_params
			params.require(:list).permit(:name, :url)
		end

end
