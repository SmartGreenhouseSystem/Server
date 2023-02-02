# frozen_string_literal: true

# == Schema Information
#
# Table name: api_keys
#
#  id         :bigint           not null, primary key
#  value      :string(50)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_api_keys_on_user_id  (user_id)
#  index_api_keys_on_value    (value) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class ApiKey < ApplicationRecord
  validates :value, length: { is: 50 }, allow_blank: false, uniqueness: true
  belongs_to :user
  has_one :device, dependent: :destroy
end
