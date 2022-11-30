# frozen_string_literal: true

class Jobs::JobsComponent < ViewComponent::Base
  attr_reader :jobs

  def initialize(jobs:)
    @jobs = jobs
  end
end
