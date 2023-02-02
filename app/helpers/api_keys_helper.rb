# frozen_string_literal: true

module ApiKeysHelper
  def encrypt_key(key)
    key[25, 50] = '*' * 25
    key
  end
end
