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
  require 'securerandom'

  validates :value, length: { is: 50 }, allow_blank: false, uniqueness: true
  belongs_to :user
  has_one :device, dependent: :destroy
  before_validation :generate_value

  private

  def generate_value
    return if value.present?

    # TL;DR: Keep generating codes until it finds one which is not used
    while ApiKey.where(value: (key = SecureRandom.hex(25))).exists? do; end

    self.value = key
  end
end
