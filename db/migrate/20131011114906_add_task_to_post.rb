class AddTaskToPost < ActiveRecord::Migration
  def change
    add_column :posts, :task, :boolean, default: false
  end
end
