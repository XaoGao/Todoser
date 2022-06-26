require "rails_helper"

RSpec.describe Button::BackComponent, type: :component do
  describe ".back_path" do
    let(:option) { { path: "some_path", class: "btn btn-primary" } }
    subject(:button) { described_class.new(option) }

    it "path is set" do
      expect(button.back_path(option)).to eq("some_path")
    end

    it "path is not set" do
      option[:path] = nil
      expect(button.back_path(option)).to eq(:back)
    end
  end
end
