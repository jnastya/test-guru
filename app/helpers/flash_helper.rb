module FlashHelper

  def flash_class(key)
    case key.to_sym
    when :notice
      'alert alert-info'
    when :success
      'alert alert-success'
    when :alert
      'alert alert-warning'
    when :error
      'alert alert-danger'
    end
  end
end
