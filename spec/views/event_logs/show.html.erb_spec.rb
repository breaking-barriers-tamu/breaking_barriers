require 'rails_helper'

RSpec.describe "event_logs/show", type: :view do
  before(:each) do
    assign(:event_log, EventLog.create!(
      hourlog_id: 2,
      user_id: 3,
      event_id: 4,
      hours: 5.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5.5/)
  end
end
