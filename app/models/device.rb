# == Schema Information
#
# Table name: devices
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  device_id  :string           not null
#
# Indexes
#
#  index_devices_on_device_id  (device_id) UNIQUE
#
class Device < ApplicationRecord
    validates :device_id, presence: true, uniqueness: true
    validates :name, presence: true
    has_many :measurements

    def active?
        cache = cached_at
        return false unless cache
        cached_at > (DateTime.now - 5.seconds)
    end

    def rssi=(value)
        Rails.cache.write(cache_name, {rssi: value, updated: DateTime.now})
    end

    def rssi
        Rails.cache.read(cache_name)&.[](:rssi).try(:to_i)
    end

    def cached_at
        Rails.cache.read(cache_name)&.[](:updated)
    end

    private

    def cache_name
        "device_#{id}_model_cache"
    end
end
