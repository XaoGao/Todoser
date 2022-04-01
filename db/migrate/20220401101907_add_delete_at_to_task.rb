class AddDeleteAtToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :delete_at, :datetime
  end
end
