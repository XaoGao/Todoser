require 'rails_helper'

RSpec.describe "Invitations", type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, author: user) }
  let(:invitation) { build(:invitation, recipient: user, project: project, consumer: user) }

  describe "POST /invitations" do
    context "when user is sign in" do
      before do
        sign_in user
        post invitations_path, params: invitation.attributes.merge(email: user.email),
                               headers: { 'HTTP_REFERER' => root_path }
      end

      it "returns http redirect after success" do
        expect(response).to have_http_status(:redirect)
        expect(Invitation.all.count).to eq 1
      end
    end

    context "when user is not sign in" do
      before do
        post invitations_path
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end
end
