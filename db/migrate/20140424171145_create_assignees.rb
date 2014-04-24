class CreateAssignees < ActiveRecord::Migration
  def change
    create_table :assignees do |t|
      t.string :assignee_name
      t.integer :task_id

      t.timestamps
    end
  end
end
