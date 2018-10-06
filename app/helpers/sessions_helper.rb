module SessionsHelper
  def change_type message_type
    if message_type == "notice"
      "success"
    elsif message_type == "alert"
      "danger"
    end
  end
end
