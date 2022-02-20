class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, default: "", null: false
      t.text :describle, default: ""
      t.integer :status, default: 0, null: false
      t.references :author, references: :user, null: false, foreign_key: { to_table: :users }
      t.references :project, references: :project, null: false, foreign_key: { to_table: :projects }

      t.timestamps
    end
  end
end
