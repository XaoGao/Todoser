require 'rails_helper'

RSpec.describe "ProjectMembers", type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, author: user) }

  describe "DELETE project/{project_id}/project_members/{id}" do

    context "when user is sign in" do
      let(:project_member) { create(:project_member, user: user, project: project) }
      before do
        sign_in user
      end

      it "http status redirect" do
        delete project_leave_path(project, user)
        expect(response).to have_http_status(:redirect)
      end

      it "destroy user from project members" do
        project_member
        delete project_leave_path(user)
        expect(project.members.count).to eq 0
      end
    end
  end
end
