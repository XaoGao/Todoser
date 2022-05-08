class RemoveDescriptionToProject < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :description
  end
end
