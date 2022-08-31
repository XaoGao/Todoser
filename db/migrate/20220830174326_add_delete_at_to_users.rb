class AddDeleteAtToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :delete_at, :datetime
  end
end
