require "rails_helper"
require "action_policy/rspec/dsl"

RSpec.describe ProjectPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:record) { create(:project) }
  let(:context) { { user: user } }

  describe_rule :show? do
    succeed "when user is member for project" do
      before { create(:project_member, user: user, project: record) }
    end

    failed "when user is not member for project" do
      # TODO: write test after add roles to user model
      # succeed "when user is a admin" do
      #   before { user.role = "admin" }
      # end
    end
  end
end
