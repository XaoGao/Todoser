# app/services/result.rb

class Result (status, data, error_messages)
    
  def success?
    status = true
  end

  def failure?
    status = false
  end
end
