# frozen_string_literal: true

module API
  class APIController < ActionController::Base
    protect_from_forgery with: :null_session
  end
end
