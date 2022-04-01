# frozen_string_literal: true

class DateAndTimeComponent < ViewComponent::Base
  def initialize(timestamp)
    @timestamp = timestamp
  end
end
