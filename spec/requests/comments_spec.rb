require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "POST /comments/" do
    context "user is sign in" do
      let(:user) { create(:user) }
      let(:project) { create(:project, author: user) }
      let(:task) { create(:task, author: user) }
      let(:comment) { build(:comment, user: user, commentable: task) }

      before(:each) do
        sign_in user
      end

      it "returns http redirect success" do
        post comments_path,
             params: { comment: { commentable_type: task.class, commentable_id: task.id, body: "Lorem ipsum dolor sit amet" } }, headers: { 'HTTP_REFERER' => root_path }
        expect(response).to have_http_status(:redirect)
      end

      it "create a new comment" do
        post comments_path,
             params: { comment: { commentable_type: task.class, commentable_id: task.id, body: "Lorem ipsum dolor sit amet" } }, headers: { 'HTTP_REFERER' => root_path }
        expect(Comment.first.body).to eq("Lorem ipsum dolor sit amet")
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        post comments_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "PUT /comments/:id" do
    context "user is sign in" do
      let(:user) { create(:user) }
      let(:task) { create(:task) }
      let(:comment) { create(:comment, user: user, commentable: task, body: "First text") }

      before(:each) do
        sign_in(user)
      end

      it "success updated comment" do
        put comment_path(comment),
            params: { comment: { body: "second value", commentable_type: task.class, commentable_id: task.id } }, headers: { 'HTTP_REFERER' => root_path }
        updated_comment = Comment.find(comment.id)
        expect(updated_comment.body).to eq("second value")
      end

      it "return success http response" do
        put comment_path(comment),
            params: { comment: { body: "second value", commentable_type: task.class, commentable_id: task.id } }, headers: { 'HTTP_REFERER' => root_path }
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "DELETE /comments/:id" do
    let(:user) { create(:user) }
    let(:task) { create(:task) }
    let(:comment) { create(:comment, user: user, commentable: task, body: "First text") }

    context "user is sign in" do
      before(:each) do
        sign_in user
      end

      it "returns http redirect after success" do
        delete comment_path(comment),
               params: { comment: { body: "", commentable_type: task.class, commentable_id: task.id } }, headers: { 'HTTP_REFERER' => root_path }
        expect(response).to have_http_status(:redirect)
      end

      it "destroy a comment" do
        delete comment_path(comment),
               params: { comment: { body: "", commentable_type: task.class, commentable_id: task.id } }, headers: { 'HTTP_REFERER' => root_path }
        expect(Comment.first.delete_at).not_to be_nil
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        delete comment_path(comment)
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
