class Device < ApplicationRecord
    validates :device_id, presence: true
    validates :name, presence: true

    def active?
        updated_at > (DateTime.now - 5.seconds)
    end
end
