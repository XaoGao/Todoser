require 'rails_helper'

RSpec.describe Marks::CreateListMarksRepository do
  subject(:repository) { described_class.new }

  describe ".call" do
    let(:project) { create(:project) }

    before do
      %w[#00d600 #ffde24 #ffb224 #ff5252 #b452ff #24ffff].each do |color|
        create(:mark, color: color)
      end
    end

    it "create marks for the project" do
      repository.call project
      expect(project.project_marks.count).to eq(6)
    end
  end
end
