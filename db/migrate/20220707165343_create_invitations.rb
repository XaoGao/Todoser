class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.references :recipient, references: :user, null: false, foreign_key: { to_table: :users }
      t.boolean :agree, default: nil # флаг, который указывает, подтвердил ли user приглашение (true), отказался от приглашения (false), ожидается ответ от user (nil)
      t.datetime :delete_at, default: nil
    end
  end
end
