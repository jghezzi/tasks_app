class RemoveTaskIdFromAssignee < ActiveRecord::Migration
  def change
  	remove_column :assignees, :task_id
  end
end
