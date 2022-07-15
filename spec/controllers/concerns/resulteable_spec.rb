require 'rails_helper'

describe Resulteable, type: :controller do
  controller(ApplicationController) do
    include Resulteable

    def success
      result = Result.new(true, "Success", nil)
      flash_service_result(result)
      head :ok
    end

    def error
      result = Result.new(false, "Alert", "Error message")
      flash_service_result(result)
      head :ok
    end
  end

  before do
    routes.draw do
      get :success, to: "anonymous#success"
      get :error, to: "anonymous#error"
    end
  end

  describe ".flash_service_result" do
    it "success flash resulteable" do
      get :success
      expect(flash[:notice]).to match(/Success/)
    end

    it "error flash resulteable" do
      get :error
      expect(flash[:alert]).to match(/Error message/)
    end
  end
end
