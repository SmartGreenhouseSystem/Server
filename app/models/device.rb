# frozen_string_literal: true

# == Schema Information
#
# Table name: devices
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  api_key_id :bigint           not null
#
# Indexes
#
#  index_devices_on_api_key_id  (api_key_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (api_key_id => api_keys.id)
#
class Device < ApplicationRecord
  validates :name, presence: true
  has_many :measurements
  belongs_to :api_key
  has_one :user, through: :api_key

  def active?
    cache = cached_at
    return false unless cache

    cached_at > (DateTime.now - 5.seconds)
  end

  def rssi=(value)
    Rails.cache.write(cache_name, { rssi: value, updated: DateTime.now })
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
