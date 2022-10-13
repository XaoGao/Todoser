class AddSenderAndTokenToInvitation < ActiveRecord::Migration[6.1]
  def change
    add_reference :invitations, :sender, foreign_key: { to_table: :users }, null: false
    add_reference :invitations, :project, foreign_key: { to_table: :projects }, null: false
    add_column :invitations, :token, :string, null: false, default: ""

    add_index :invitations, :token, unique: true
  end
end
