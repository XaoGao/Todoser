class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body, default: "", null: false
      t.references :user, references: :user, null: false, foreign_key: { to_table: :users }
      t.references :commentable, polymorphic: true
      t.datetime :delete_at, default: nil

      t.timestamps
    end
  end
end
