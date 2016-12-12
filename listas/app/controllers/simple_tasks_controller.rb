class SimpleTasksController < ApplicationController
	
	def index
		@simpleTask = SimpleTask.all
	end

	def new
		@simpleTask = SimpleTask.new
	end

	def edit
		#@list = List.find_by(url:params[:list_id])
		@simpleTask = SimpleTask.find(params[:id])

	end
	def show

	end

	def create

	    @list = List.find_by(url:params[:list_id])
	    @simpleTask = SimpleTask.new(simple_task_params)
	    @simpleTask.list_id = @list.id
	    if @simpleTask.save
	    	redirect_to list_path(@list)
	    else
	    	render 'new'
	    end
	    
	    
	end

	def update
		@simpleTask = SimpleTask.find(params[:id])
		@list = List.find(@simpleTask.list_id)
		if @simpleTask.update(simple_task_params)
			redirect_to @list
		else
			render 'edit'
		end
	end

	def destroy
		@list = List.find_by(url:params[:list_id])
		@task = SimpleTask.find(params[:id])
		@task.destroy
		redirect_to list_path(@list)
	end
 
	private
	    def simple_task_params
	      params.require(:simple_task).permit(:description, :state, :priority)
	    end
end












