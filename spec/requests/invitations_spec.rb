require 'rails_helper'

RSpec.describe "Invitations", type: :request do
  describe "GET /project/:project_id/invitations/new" do
    let(:project) { create(:project) }

    context "when user is sign in" do
      let(:user) { create(:user) }

      before do
        create(:project_member, user: user, project: project)
        sign_in user
      end

      it "http status success" do
        get new_project_invitation_path(project)
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not sign in" do
      before do
        get new_project_invitation_path(project)
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "POST /project/:project_id/invitations/" do
    let(:project) { create(:project) }

    context "when user is sign in" do
      let(:user) { create(:user) }
      let(:recipient) { create(:user) }

      before do
        create(:project_member, user: user, project: project)
        sign_in user
      end

      it "http status redirect" do
        post project_invitations_path(project),
             params: { invitation: { email: recipient.email } },
             headers: { "HTTP_REFERER" => root_path }
        expect(response).to have_http_status(:redirect)
      end

      it "created a new invitation" do
        post project_invitations_path(project),
             params: { invitation: { email: recipient.email } },
             headers: { "HTTP_REFERER" => root_path }
        expect(Invitation.find_by(sender: user, recipient: recipient)).not_to be_nil
      end

      it "recipient is not found" do
        post project_invitations_path(project),
             params: { invitation: { email: "not_exist_user@test.com" } },
             headers: { "HTTP_REFERER" => root_path }
        expect(Invitation.all.count).to eq 0
        expect(flash[:alert]).to eq(I18n.t("invitations.create.user_not_found"))
      end
    end

    context "when user is not sign in" do
      before do
        post project_invitations_path(project)
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "PUT /project/:project_id/invitations/:token/confirm" do
    let(:project) { create(:project) }
    let(:user) { create(:user) }
    let(:recipient) { create(:user) }

    context "when user is sign in" do
      before do
        create(:project_member, user: user, project: project)
        create(:invitation, sender: user, recipient: recipient, project: project, token: "82efeda9f88d065d3534")
        sign_in user
        put confirm_project_invitations_path(project, "82efeda9f88d065d3534")
      end

      it "http status redirect" do
        expect(response).to have_http_status(:redirect)
      end

      it "created a project memeber" do
        expect(ProjectMember.find_by(user: recipient, project: project)).not_to be_nil
      end
    end

    context "when token is invalid" do
      before do
        create(:project_member, user: user, project: project)
        create(:invitation, sender: user, recipient: recipient, project: project, token: "82efeda9f88d065d3534")
        sign_in user
        put confirm_project_invitations_path(project, "invalid_token_00000")
      end

      it "http status redirect" do
        expect(response).to have_http_status(:redirect)
      end

      it "user is not found" do
        expect(ProjectMember.find_by(user: recipient, project: project)).to be_nil
        expect(flash[:alert]).to eq(I18n.t("invitations.confirm.not_found"))
      end
    end

    context "when user is not sign in" do
      before do
        put confirm_project_invitations_path(project, "anytoken")
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end
end
