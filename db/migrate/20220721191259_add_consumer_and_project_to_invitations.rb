class AddConsumerAndProjectToInvitations < ActiveRecord::Migration[6.1]
  def change
    add_reference :invitations, :project, foreign_key: true
    add_reference :invitations, :consumer, references: :users
  end
end
