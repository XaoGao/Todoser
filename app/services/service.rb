## В Сервисе всегда будет создаваться результат выполнения,
#  и он будет одним из двух вариантов: успешен/ не успешен(провален)
class Service
  # Определяет успешное выполнение сервиса
  def success(data)
    Result.new(true, data, nil)
  end

  # Определяет не успешное(провальное) выполнение сервиса
  def failure(error_messages, data = nil)
    Result.new(false, data, error_messages)
  end
end
