class AddUsernameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string, null: false, default: ""

    User.all do |user|
      user.username = "@#{user.email.split("@").first}"
    end
  end
end
