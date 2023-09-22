require 'rails_helper'

RSpec.describe "event_logs/index", type: :view do
  before(:each) do
    assign(:event_logs, [
      EventLog.create!(
        hourlog_id: 2,
        user_id: 3,
        event_id: 4,
        hours: 5.5
      ),
      EventLog.create!(
        hourlog_id: 2,
        user_id: 3,
        event_id: 4,
        hours: 5.5
      )
    ])
  end

  it "renders a list of event_logs" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(5.5.to_s), count: 2
  end
end
