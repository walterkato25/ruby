class LongTasksController < ApplicationController
	def index
		@longTask = LongTask.all
	end

	def new
		@longTask = LongTask.new
	end

	def edit
		#@list = List.find_by(url:params[:list_id])
		@longTask = LongTask.find(params[:id])

	end
	def show
		@today = Time.now
		@longTasks = LongTask.find(:all, :conditions => {:@today => validation_start..validation_end})

	end

	def create

	    @list = List.find_by(url:params[:list_id])
	    @longTask = LongTask.new(long_task_params)
	    @longTask.list_id = @list.id
	    if @longTask.save()
	    	redirect_to list_path(@list)
	    else
	    	render 'new'
	    end   
	    
	end

	def update
		@longTask = LongTask.find(params[:id])
		@list = List.find(@longTask.list_id)
		if @longTask.update(long_task_params)
			redirect_to @list
		else
			render 'edit'
		end
	end

	def destroy
		@list = List.find_by(url:params[:list_id])
		@task = LongTask.find(params[:id])
		@task.destroy
		redirect_to list_path(@list)
	end
 
	private
	    def long_task_params
	      params.require(:long_task).permit(:description, :state, :percentage, :priority)
	    end
end
