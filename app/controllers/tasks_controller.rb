class TasksController < ApplicationController

def index
	@tasks = Task.all
end

def new
	@task = Task.new
end

def create
	@new_task = Task.new(task_params)
	if @new_task.save
		redirect_to tasks_path
	end
end

def edit
	@task = Task.find(params[:id])
end

def update
	@task = Task.find(params[:id])
	if @task.update_attributes(task_params)
		redirect_to "/tasks"
	end	
end

def destroy
		@task = Task.find(params[:id])
		@task.destroy
		redirect_to tasks_path
	end

	def search
		puts "======> PARAMS =======> #{params}"
		@tasks = Task.search(params[:search])
	end

	private

	def task_params
		params.require(:task).permit!
	end


end
