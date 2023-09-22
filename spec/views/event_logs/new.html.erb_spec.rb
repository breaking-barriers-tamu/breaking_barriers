require 'rails_helper'

RSpec.describe "event_logs/new", type: :view do
  before(:each) do
    assign(:event_log, EventLog.new(
      hourlog_id: 1,
      user_id: 1,
      event_id: 1,
      hours: 1.5
    ))
  end

  it "renders new event_log form" do
    render

    assert_select "form[action=?][method=?]", event_logs_path, "post" do

      assert_select "input[name=?]", "event_log[hourlog_id]"

      assert_select "input[name=?]", "event_log[user_id]"

      assert_select "input[name=?]", "event_log[event_id]"

      assert_select "input[name=?]", "event_log[hours]"
    end
  end
end
