class AddDeleteAtAndSlugToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :delete_at, :datetime
    add_column :projects, :description, :text, default: ""
    add_column :projects, :short_title, :string, default: ""
  end
end
