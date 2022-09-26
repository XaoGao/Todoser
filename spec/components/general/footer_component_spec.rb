require "rails_helper"

RSpec.describe General::FooterComponent, type: :component do
  subject(:footer) { described_class.new }

  it "renders footer" do
    render_inline(footer)

    expect(page).to have_text("Copyright: Todoser.com")
  end
end
