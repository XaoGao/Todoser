class AddStatusToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :status, :integer, deafult: 0
    Project.all do |p|
      p.update(status: :active)
    end
  end
end
