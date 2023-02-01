class Device < ApplicationRecord
    def active?
        updated_at > (DateTime.now - 5.seconds)
    end
end
