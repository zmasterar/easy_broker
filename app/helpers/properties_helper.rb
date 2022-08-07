# frozen_string_literal: true

# Class PropertiesHelper
module PropertiesHelper
  def format_property_operation_type(type)
    case type
    when 'sale'
      'For Sale'
    when 'rental'
      'Rental'
    else
      '-'
    end
  end

  def format_boolean(boolean)
    boolean ? 'Yes' : 'No'
  end

  def format_quantity(quantity)
    quantity || 'No'
  end

  def previous_page(pagination)
    page = pagination['page']
    page > 1 ? page - 1 : nil
  end

  def next_page(pagination)
    page = pagination['page']
    total_pages = (pagination['total'].to_f / pagination['limit']).ceil
    page + 1 > total_pages ? nil : page + 1
  end
end
