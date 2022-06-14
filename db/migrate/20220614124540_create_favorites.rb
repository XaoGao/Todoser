class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :favoriteable, polymorphic: true
      t.datetime :delete_at, default: nil

      t.timestamps
    end
  end
end
