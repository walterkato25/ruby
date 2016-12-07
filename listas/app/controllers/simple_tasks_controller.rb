class SimpleTasksController < ApplicationController
	def new
		@simpleTask = SimpleTask.new
	end
	def create
	    @list = List.find_by(params[:list_url])
	    @list_id = List.find_by(params[:list_url]).id
	    @simple_task = SimpleTask.new(simple_task_params)
	    @simple_task.list_id = @list_id
	    @simple_task.save()
	    
	    redirect_to list_path(@list)
	end
 
	private
	    def simple_task_params
	      params.require(:simple_task).permit(:description, :state, :priority)
	    end
end
