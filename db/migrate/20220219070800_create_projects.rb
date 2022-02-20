class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title, defailt: "", null: false
      t.references :author, references: :user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
