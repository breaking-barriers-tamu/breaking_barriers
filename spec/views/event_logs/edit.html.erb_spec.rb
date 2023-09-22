require 'rails_helper'

RSpec.describe "event_logs/edit", type: :view do
  let(:event_log) {
    EventLog.create!(
      hourlog_id: 1,
      user_id: 1,
      event_id: 1,
      hours: 1.5
    )
  }

  before(:each) do
    assign(:event_log, event_log)
  end

  it "renders the edit event_log form" do
    render

    assert_select "form[action=?][method=?]", event_log_path(event_log), "post" do

      assert_select "input[name=?]", "event_log[hourlog_id]"

      assert_select "input[name=?]", "event_log[user_id]"

      assert_select "input[name=?]", "event_log[event_id]"

      assert_select "input[name=?]", "event_log[hours]"
    end
  end
end
