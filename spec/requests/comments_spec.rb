require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  describe "POST /comments/" do
    context "when user is sign in" do
      let(:project) { create(:project, author: user) }
      let(:task) { create(:task, author: user, project: project) }
      let(:comment) { build(:comment, user: user, commentable: task) }

      before do
        sign_in user
        create(:project_member, project: project, user: user)
        post comments_path,
             params: { comment: comment.attributes.merge(message: "Lorem ipsum dolor sit amet") },
             headers: { "HTTP_REFERER" => root_path }
      end

      it "http redirect success" do
        expect(response).to have_http_status(:redirect)
      end

      it "create a new comment" do
        expect(Comment.first.message.to_plain_text).to eq("Lorem ipsum dolor sit amet")
      end
    end

    context "when user is not sign in" do
      before { post comments_path }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "PUT /comments/:id" do
    context "when user is sign in" do
      let(:task) { create(:task, project: project) }
      let(:comment) { create(:comment, user: user, commentable: task, message: "First text") }

      before do
        create(:project_member, project: project, user: user)
        sign_in user
        put comment_path(comment),
            params: { comment: { commentable_type: task.class, commentable_id: task.id, message: "second value" } },
            headers: { "HTTP_REFERER" => root_path }
      end

      it "success updated comment" do
        expect(comment.reload.message.to_plain_text).to eq("second value")
      end

      it "return success http response" do
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when user is not sign in" do
      before { post comments_path }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "DELETE /comments/:id" do
    let(:task) { create(:task, project: project) }
    let(:comment) { create(:comment, user: user, commentable: task) }

    context "when user is sign in" do
      before do
        create(:project_member, project: project, user: user)
        sign_in user
        delete comment_path(comment),
               params: { comment: { commentable_type: task.class, commentable_id: task.id } },
               headers: { "HTTP_REFERER" => root_path }
      end

      it "http redirect after success" do
        expect(response).to have_http_status(:redirect)
      end

      it "destroy a comment" do
        expect(comment.reload.delete_at).not_to be_nil
      end
    end

    context "when user is not sign in" do
      before { delete comment_path(comment) }

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end
end
