# frozen_string_literal: true

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
require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
