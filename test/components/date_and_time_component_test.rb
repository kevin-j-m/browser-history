# frozen_string_literal: true

require "test_helper"

class DateAndTimeComponentTest < ViewComponent::TestCase
  test "displays the formatted date" do
    time = DateTime.new(2022, 3, 20, 3, 25, 6)
    render_inline(DateAndTimeComponent.new(time))

    assert_selector "p", id: "date", text: "Mar 20, 2022"
  end

  test "displays the formatted time" do
    time = DateTime.new(2022, 3, 20, 3, 25, 6)
    render_inline(DateAndTimeComponent.new(time))

    assert_selector "p", id: "time", text: "03:25 AM"
  end
end
