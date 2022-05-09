require "rails_helper"

RSpec.describe Button::BaseComponent, type: :component do
  let(:test_url) { "/some/url/path" }
  let(:test_label) { "player" }
  subject(:button) { described_class.new(test_label, test_url, class: "btn btn-primary") }

  describe ".default_classes" do
    it { expect(button.default_classes).to eq("") }
  end

  it "renders base button" do
    render_inline(button)

    expect(rendered_component).to have_text(test_label)
    expect(rendered_component).to have_link(test_label, href: test_url)
  end
end
