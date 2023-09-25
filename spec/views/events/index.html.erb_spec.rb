# require 'rails_helper'

# RSpec.describe "events/index", type: :view do
#   before(:each) do
#     assign(:events, [
#       Event.create!(
#         name: "Name",
#         description: "Description",
#         location: "Location",
#         duration: "9.99"
#       ),
#       Event.create!(
#         name: "Name",
#         description: "Description",
#         location: "Location",
#         duration: "9.99"
#       )
#     ])
#   end

#   it "renders a list of events" do
#     render
#     cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
#     assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
#     assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
#     assert_select cell_selector, text: Regexp.new("Location".to_s), count: 2
#     assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
#   end
# end
