require "rails_helper"

RSpec.describe Button::BaseComponent, type: :component do
  subject(:button) { described_class.new("Label text", "some url path", class: "btn btn-primary") }

  describe ".default_classes" do
    it { expect(button.default_classes).to eq("") }
  end
end
