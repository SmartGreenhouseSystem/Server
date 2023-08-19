# == Schema Information
#
# Table name: actuators
#
#  id          :bigint           not null, primary key
#  consumption :integer
#  name        :string
#  state       :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class ActuatorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
