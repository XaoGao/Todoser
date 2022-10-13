require "rails_helper"
require "action_policy/rspec/dsl"

RSpec.describe InvitationPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:record) { create(:project) }
  let(:context) { { user: user } }

  describe_rule :new? do
    succeed "when user is member for project" do
      before { create(:project_member, user: user, project: record) }
    end

    failed "when user is not member for project"
  end

  describe_rule :create? do
    succeed "when user is member for project" do
      before { create(:project_member, user: user, project: record) }
    end

    failed "when user is not member for project"
  end
end
