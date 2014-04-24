class Assignee < ActiveRecord::Base
	has_many :tasks

	def self.search(name)
  	where("assignee_name like ?","%#{name}%")
	end

end
