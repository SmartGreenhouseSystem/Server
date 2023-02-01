# == Schema Information
#
# Table name: measurements
#
#  id               :bigint           not null, primary key
#  measurement_type :string           not null
#  name             :string           not null
#  recorded_at      :datetime         not null
#  unit             :string           not null
#  value            :float            not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  device_id        :bigint           not null
#
# Indexes
#
#  index_measurements_on_device_id  (device_id)
#
# Foreign Keys
#
#  fk_rails_...  (device_id => devices.id)
#
class Measurement < ApplicationRecord
    validates :name, presence: true
    validates :measurement_type, presence: true
    validates :unit, presence: true
    validates :value, presence: true
    validates :recorded_at, presence: true
    belongs_to :device
end
