class AssigneesController < ApplicationController

	def index
		@assignees = Assignee.all
	end

	def new
		@new_assignee = Assignee.new
	end

	def create
		@new_assignee = Assignee.new(assignee_params)
			if @new_assignee.save
				redirect_to assignees_path
			else
				render new_assignee_path
			end
	end

	def edit
		@assignee = Assignee.find(params[:id])
	end
		
	def update
		@assignee = Assignee.find(params[:id])
		if @assignee.update_attributes(assignee_params)
			redirect_to assignee_path(@assignee)
		end	
	end

	def destroy
		@assignee = Assignee.find(params[:id])
		@assignee.destroy
		redirect_to assignees_path
	end

	def search
		@search_results = Assignee.search(params[:search_assignee_name])
	end

	private

		def assignee_params
			params.require(:assignee).permit!
		end

end
