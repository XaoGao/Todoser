require 'rails_helper'

RSpec.describe "Admin::BackgroundJobs", type: :request do
  describe "GET /admin/background_jobs/" do
    context "user is sign in" do
      let(:user) { create(:user, role: User.roles[:admin]) }
      before(:each) do
        sign_in user
      end

      it "returns http success" do
        get admin_background_jobs_path
        expect(response).to have_http_status(:success)
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        get admin_background_jobs_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "user is not admin" do
      let(:user) { create(:user, role: User.roles[:user]) }
      before(:each) do
        sign_in user
      end

      it "returns redirect to root_page sign in page" do
        get admin_background_jobs_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "PUT /admin/background_jobs/:name/toggle" do
    context "user is sign in" do
      let(:user) { create(:user, role: User.roles[:admin]) }

      before(:each) do
        sign_in user
      end

      it "returns http success" do
        dbl = double("Some sidekiq job")
        allow(dbl).to receive_messages(name: "name job",
          status: "enabled",
          cron: "* * * * *",
          last_enqueue_time: Time.now,
          klass: "Some class")

        result = Result.new(true, SidekiqJobAdapter.new(sidekiq_job: dbl), nil)
        service = double("jobs_toggle_service", call: result)
        allow_any_instance_of(Admin::BackgroundJobsController).to receive(:jobs_toggle_service).and_return(service)
        put toggle_admin_background_job_path(name: "test job"), xhr: true
        expect(response).to have_http_status(:success)
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        put toggle_admin_background_job_path(name: "test job")
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "user is not admin" do
      let(:user) { create(:user, role: User.roles[:user]) }
      before(:each) do
        sign_in user
      end

      it "returns redirect to root_page sign in page" do
        put toggle_admin_background_job_path(name: "test job")
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "PUT /admin/background_jobs/:name/launch" do
    context "user is sign in" do
      let(:user) { create(:user, role: User.roles[:admin]) }

      before(:each) do
        sign_in user
      end

      it "returns http success" do
        dbl = double("Some sidekiq job")
        allow(dbl).to receive_messages(name: "name job",
          status: "enabled",
          cron: "* * * * *",
          last_enqueue_time: Time.now,
          klass: "Some class")

        result = Result.new(true, SidekiqJobAdapter.new(sidekiq_job: dbl), nil)
        service = double("jobs_launch_service", call: result)
        allow_any_instance_of(Admin::BackgroundJobsController).to receive(:jobs_launch_service).and_return(service)
        put launch_admin_background_job_path(name: "test job"), xhr: true
        expect(response).to have_http_status(:success)
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        put launch_admin_background_job_path(name: "test job")
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "user is not admin" do
      let(:user) { create(:user, role: User.roles[:user]) }
      before(:each) do
        sign_in user
      end

      it "returns redirect to root_page sign in page" do
        put launch_admin_background_job_path(name: "test job")
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to root_path
      end
    end
  end
end
