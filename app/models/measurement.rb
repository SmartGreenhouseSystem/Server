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
#
class Measurement < ApplicationRecord
end
