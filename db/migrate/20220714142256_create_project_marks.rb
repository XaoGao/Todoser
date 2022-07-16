class CreateProjectMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :project_marks do |t|
      t.references :mark, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
