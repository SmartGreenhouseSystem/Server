# frozen_string_literal: true

class ApiKeysController < ApplicationController
  def index
    @api_keys = current_user.api_keys
  end

  def create; end

  def delete; end
end
