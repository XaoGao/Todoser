require "rails_helper"
require "action_policy/rspec/dsl"

RSpec.describe TaskPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  let(:record) { create(:task, author: user, project: project) }
  let(:context) { { user: user } }

  describe_rule :index? do
    succeed "when user is member for task" do
      before do
        create(:project_member, user: user, project: project)
      end
    end
    failed "when user is not member for task"
  end

  describe_rule :new? do
    succeed "when user is member for task" do
      before do
        create(:project_member, user: user, project: project)
      end
    end
    failed "when user is not member for task"
  end

  describe_rule :create? do
    succeed "when user is member for task" do
      before do
        create(:project_member, user: user, project: project)
      end
    end
    failed "when user is not member for task"
  end

  describe_rule :edit? do
    succeed "when user is member for task" do
      before do
        create(:project_member, user: user, project: project)
      end
    end
    failed "when user is not member for task"
  end

  describe_rule :update? do
    succeed "when user is member for task" do
      before do
        create(:project_member, user: user, project: project)
      end
    end
    failed "when user is not member for task"
  end

  describe_rule :destroy? do
    succeed "when user is member for task" do
      before do
        create(:project_member, user: user, project: project)
      end
    end
    failed "when user is not member for task"
  end

  describe_rule :show? do
    succeed "when user is member for task" do
      before do
        create(:project_member, user: user, project: project)
      end
    end
    failed "when user is not member for task"
  end
end
