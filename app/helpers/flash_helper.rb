module FlashHelper
  def flash_messages
    flash.collect do |key, msg|
      puts "#{key}"
      alert_class = case(key.to_sym)
      when :notice
        "success"
      when :error
        "danger"
      else
        "info"
      end

      content_tag(:div, msg, :id => key, :class => "alert alert-#{alert_class} center flash-message")
    end.join.html_safe
  end
end
