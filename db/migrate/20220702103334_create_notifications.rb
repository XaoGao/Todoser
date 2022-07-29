class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :sender, references: :user, null: false, foreign_key: { to_table: :users }
      t.references :recipient, references: :user, null: false, foreign_key: { to_table: :users }
      t.string :body, null: false, default: ""
      t.datetime :read_at, default: nil

      t.timestamps
    end
  end
end
