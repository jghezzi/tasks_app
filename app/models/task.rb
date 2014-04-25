class Task < ActiveRecord::Base
	belongs_to :assignee

	def self.search(params)
		assignee_name = params[:assignee_name]
		task_name = params[:task_name]
		date_from = params[:due_date_from]
		date_to = params[:due_date_to]
		done = params[:done]

		search = Task.all

		if assignee_name.present?
			# assignee_name.downcase!
			search = search.by_assignee_name(assignee_name)
		end

		if task_name.present?
			# task_name.downcase!
			search = search.by_task_name(task_name)
		end

		if date_from.present? && date_to.present?
			# task_name.downcase!
			search = search.by_date_range(date_from, date_to)
		end

		if done.present?
			# task_name.downcase!
			search = search.by_done(done)
		end

		search
	end

	def self.by_assignee_name(name)
		joins(:assignee).where('assignees.assignee_name = ?', name)
	end

	def self.by_task_name(name)
		joins(:assignee).where('task_name = ?', name)
	end

	def self.by_date_range(date_from, date_to)
		joins(:assignee).where('due_date BETWEEN ? and ?', date_from, date_to)
	end

	def self.by_done(done)
		joins(:assignee).where('done = ?', done)
	end
	# def self.name_search(name)
	# 	Assignee.joins(:tasks).where("LOWER(assignee_name) LIKE ?", "%#{name}%")
	# end

	
end
