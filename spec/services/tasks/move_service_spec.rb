require 'rails_helper'

RSpec.describe Tasks::MoveService do
  subject(:service) { described_class.new }

  describe ".call" do
    let(:task) { create(:task, status: "doing", position: 1) }

    context "when success" do
      it "result is success" do
        result = service.call(task.id, "done", 2, status: "done", position: 2)
        expect(result.success?).to be true
      end

      it "updates a task" do
        result = service.call(task.id, "done", 2, status: "done", position: 2)
        expect(result.data.status).to eq("done")
      end
    end

    context "when failure" do
      it "result is failure" do
        result = service.call(task.id, "wrong", 2, status: "wrong", position: 2)
        expect(result.success?).to be false
      end

      it "unexpected error message" do
        result = service.call(task.id, "wrong", 2, status: "wrong", position: 2)
        expect(result.error_messages).to eq(I18n.t("errors.unexpected_error"))
      end
    end
  end
end
