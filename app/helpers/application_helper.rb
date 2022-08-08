# frozen_string_literal: true

# Application Helper class
module ApplicationHelper
  def flash_css_class(type)
    case type
    when 'notice' then 'alert-success'
    when 'alert' then 'alert-danger'
    else 'alert-primary'
    end
  end
end
