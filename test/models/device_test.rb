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
require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
