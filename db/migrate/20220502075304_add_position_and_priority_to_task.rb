class AddPositionAndPriorityToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :position, :integer, default: 0, null: false
    add_column :tasks, :priority, :integer, default: 0, null: false
    Task.all.each do |task|
      task.update(position: 0, priority: 0)
    end
  end
end
