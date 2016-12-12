class TemporalTasksController < ApplicationController
	
	def index
		@temporalTask = TemporalTask.all
	end

	def new
		@temporalTask = TemporalTask.new
	end

	def edit
		#@list = List.find_by(url:params[:list_id])
		@temporalTask = TemporalTask.find(params[:id])

	end
	def show
		@today = Time.now
		@temporalTasks = TemporalTask.find(:all, :conditions => {:@today => validation_start..validation_end})

	end

	def create

	    @list = List.find_by(url:params[:list_id])
	    @temporalTask = TemporalTask.new(temporal_task_params)
	    @temporalTask.list_id = @list.id
	    @temporalTask.save()
	    
	    redirect_to list_path(@list)
	end

	def update
		@temporalTask = TemporalTask.find(params[:id])
		@list = List.find(@temporalTask.list_id)
		if @temporalTask.update(temporal_task_params)
			redirect_to @list
		else
			render 'edit'
		end
	end

	def destroy
		@list = List.find_by(url:params[:list_id])
		@task = TemporalTask.find(params[:id])
		@task.destroy
		redirect_to list_path(@list)
	end
 
	private
	    def temporal_task_params
	      params.require(:temporal_task).permit(:description, :state, :priority, :validation_start, :validation_end)
	    end

end