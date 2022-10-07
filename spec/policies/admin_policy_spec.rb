require "rails_helper"
require "action_policy/rspec/dsl"

RSpec.describe AdminPolicy, type: :policy do
  let(:user) { create(:user, role: User.roles[:admin]) }

  let(:context) { { user: user } }

  describe_rule :any_admin_page? do
    succeed "when user is admin"

    failed "when user is not admin" do
      before do
        user.role = User.roles[:user]
      end
    end
  end
end
