require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "POST /comments/" do
    context "when user is sign in" do
      let(:user) { create(:user) }
      let(:project) { create(:project, author: user) }
      let(:task) { create(:task, author: user) }
      let(:comment) { build(:comment, user: user, commentable: task) }

      before do
        sign_in user
        post comments_path,
             params: { comment: { commentable_type: task.class, commentable_id: task.id, body: "Lorem ipsum dolor sit amet" } },
             headers: { "HTTP_REFERER" => root_path }
      end

      it "http redirect success" do
        expect(response).to have_http_status(:redirect)
      end

      it "create a new comment" do
        expect(Comment.first.body).to eq("Lorem ipsum dolor sit amet")
      end
    end

    context "when user is not sign in" do
      before do
        post comments_path
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "PUT /comments/:id" do
    context "when user is sign in" do
      let(:user) { create(:user) }
      let(:task) { create(:task) }
      let(:comment) { create(:comment, user: user, commentable: task, body: "First text") }

      before do
        sign_in user
        put comment_path(comment),
            params: { comment: { body: "second value", commentable_type: task.class, commentable_id: task.id } },
            headers: { "HTTP_REFERER" => root_path }
      end

      it "success updated comment" do
        updated_comment = Comment.find(comment.id)
        expect(updated_comment.body).to eq("second value")
      end

      it "return success http response" do
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when user is not sign in" do
      before do
        post comments_path
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "DELETE /comments/:id" do
    let(:user) { create(:user) }
    let(:project) { create(:project) }
    let(:task) { create(:task, project: project) }
    let(:comment) { create(:comment, user: user, commentable: task, body: "First text") }

    context "when user is sign in" do
      before do
        create(:project_member, project: project, user: user)
        sign_in user
        delete comment_path(comment),
               params: { comment: { body: "", commentable_type: task.class, commentable_id: task.id } },
               headers: { "HTTP_REFERER" => root_path }
      end

      it "http redirect after success" do
        expect(response).to have_http_status(:redirect)
      end

      it "destroy a comment" do
        expect(Comment.first.delete_at).not_to be_nil
      end
    end

    context "when user is not sign in" do
      before do
        delete comment_path(comment)
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end
end
