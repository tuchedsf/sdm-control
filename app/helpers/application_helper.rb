module ApplicationHelper
  def formata_data( data)
    if !data.nil?
    data.strftime("%d/%m/%Y")
    end
  end


   def formata_SimNao(var)
    #Rails.logger.debug "DEBUG: formata_SimNao - params are #{var}"

    if !var.nil?
      if var == true
        var = "Sim"
      else
        var = "Não"
      end
    else
      var = "--"
    end
  end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        concat message
      end)
    end
    nil
  end


end
