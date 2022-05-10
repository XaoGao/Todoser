class RemoveDescribleToTask < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :describle
  end
end
