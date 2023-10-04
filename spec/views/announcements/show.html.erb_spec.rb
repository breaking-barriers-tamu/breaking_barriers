require 'rails_helper'

RSpec.describe "announcements/show", type: :view do
  before(:each) do
    assign(:announcement, Announcement.create!(
      title: "Title",
      body: "Body",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Body/)
    expect(rendered).to match(//)
  end
end
