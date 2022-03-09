module ApplicationHelper
  def flash_class(type)
    case type
    when "notice"
      "alert alert-success alert-dismissible"
    when "alert"
      "alert alert-danger alert-dismissible"
    end
  end
end
