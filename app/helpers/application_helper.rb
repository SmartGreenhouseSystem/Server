module ApplicationHelper
    def active_navbar_selection?(name)
        return controller_name == name ? 'active' : ''
    end
end
