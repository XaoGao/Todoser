class AddUsersCounterToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :project_members_count, :integer, default: 0, null: false
  end
end
