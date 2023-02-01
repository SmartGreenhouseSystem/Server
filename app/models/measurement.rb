# == Schema Information
#
# Table name: measurements
#
#  id               :bigint           not null, primary key
#  measurement_type :string
#  name             :string
#  recorded_at      :datetime
#  unit             :string
#  value            :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Measurement < ApplicationRecord
end
