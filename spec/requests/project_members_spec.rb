require 'rails_helper'

RSpec.describe "ProjectMembers", type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, author: user) }

  describe "DELETE project/{project_id}/leave" do
    context "when user is sign in" do
      before do
        sign_in user
        create(:project_member, user: user, project: project)
      end

      it "http status redirect" do
        delete project_leave_path(project, user)
        expect(response).to have_http_status(:redirect)
      end

      it "destroy user from project members" do
        delete project_leave_path(project, user)
        expect(project.members.count).to eq 0
      end
    end
  end
end
