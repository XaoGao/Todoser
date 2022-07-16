class CreateTaskProjectMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :task_project_marks do |t|
      t.references :project_mark, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
