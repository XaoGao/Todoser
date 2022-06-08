class Service
  # Создаёт результат работы сервиса
  def success(data)
    Result.new(true, data, nil)
  end

  # Создаёт ошибочный результат работы сервиса
  def failure(error_messages, data = nil)
    Result.new(false, data, error_messages)
  end
end
