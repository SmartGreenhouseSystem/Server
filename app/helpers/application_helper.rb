module ApplicationHelper
    def active_navbar_selection?(name)
        return controller_name == name ? 'active' : ''
    end

    def inactive_device?(id)
        Device.find(id).updated_at < (DateTime.now - 5.seconds)
    end
end
