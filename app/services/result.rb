class Result
  attr_reader :status, :data, :error_messages

  def initialize(status, data, error_messages)
    @status = status
    @data = data
    @error_messages = error_messages
  end

  def success?
    @status
  end

  def failure?
    !@status
  end
end
