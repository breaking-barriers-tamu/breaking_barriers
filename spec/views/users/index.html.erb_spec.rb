# require 'rails_helper'

# RSpec.describe "users/index", type: :view do
#   before(:each) do
#     assign(:users, [
#       User.create!(
#         access_level: 2,
#         name: "Name",
#         major: "Major",
#         year: 3,
#         phone_number: "Phone Number",
#         email: "Email"
#       ),
#       User.create!(
#         access_level: 2,
#         name: "Name",
#         major: "Major",
#         year: 3,
#         phone_number: "Phone Number",
#         email: "Email"
#       )
#     ])
#   end

#   it "renders a list of users" do
#     render
#     cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
#     assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
#     assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
#     assert_select cell_selector, text: Regexp.new("Major".to_s), count: 2
#     assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
#     assert_select cell_selector, text: Regexp.new("Phone Number".to_s), count: 2
#     assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
#   end
# end
