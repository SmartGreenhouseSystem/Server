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
class Actuator < ApplicationRecord
    validates :name, presence: true
    validates :state, presence: true
    validates :consumption, presence: true
    validates :recorded_at, presence: true
    belongs_to :device
end
