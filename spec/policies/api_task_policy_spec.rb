require "rails_helper"
require "action_policy/rspec/dsl"

RSpec.describe ApiTaskPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:record) { create(:task, project: project) }
  let(:context) { { user: user} }

  describe_rule :show? do
    succeed "when user is member for project" do
      before do
        create(:project_member, user: user, project: project)
      end
    end

    failed "when user is not member for project"
  end
end
