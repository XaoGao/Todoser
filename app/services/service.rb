class Service

  def sucess(data)
    Result.new(true, data, nil)
  end

  def failure(error_message, data = nil)
    Result.new(false, data, error_messages)
  end

end 

