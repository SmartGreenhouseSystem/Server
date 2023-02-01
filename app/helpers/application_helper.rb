# frozen_string_literal: true

module ApplicationHelper
  def active_navbar_selection?(name)
    controller_name == name ? 'active' : ''
  end

  def inactive_device?(id)
    Device.find(id).updated_at < (DateTime.now - 5.seconds)
  end
end
