require 'rails_helper'

RSpec.describe('Anonymous Comments', type: :feature) do
  let!(:member) { create(:user, phone_number: '(214) 123 - 4567', first_name: 'first_name_1', last_name: 'last_name_1', access_level: 0, registration_completed: true) }
  let!(:member2) { create(:user, phone_number: '(214) 123 - 4567', first_name: 'First', last_name: 'Last', access_level: 0, registration_completed: true) }
  let!(:admin) { create(:user, phone_number: '(214) 123 - 4567', first_name: 'admin', last_name: 'admin', access_level: 1, registration_completed: true) }
  let!(:announcement) { create(:announcement) }

  # --- Sunny Day: Member adds anonymous Comment ---
  it 'Member adds anonymous Comment' do
    sign_in(member)
    visit announcement_path(announcement)

    fill_in 'comment_box', with: 'This is an anonymous comment'
    check 'Post anonymously'
    click_on 'Add Comment'

    expect(page).to(have_content('This is an anonymous comment'))
    expect(page).to(have_content('Anonymous'))

    # Ensuring the original poster sees the name with anonymous tag
    visit announcement_path(announcement)
    expect(page).to(have_content(member.name))
    expect(page).to(have_content('(Posted as Anonymous)'))
  end

  # --- Rainy Day: Member can't see anonymous member name ---
  it 'Member can not see anonymous member name' do
    sign_in(member)
    anon_comment = create(:comment, user: member2, announcement: announcement, anonymous: true)

    visit announcement_path(announcement)

    expect(page).to(have_content('Anonymous'))
    expect(page).to(have_content(anon_comment.content))
    expect(page).not_to(have_content(member2.name))
  end

  # --- Sunny Day: Admin can see anonymous member name ---
  it 'Admin can see anonymous member name' do
    sign_in(admin)
    anon_comment = create(:comment, user: member2, announcement: announcement, anonymous: true)

    visit announcement_path(announcement)

    expect(page).to(have_content('(Posted as Anonymous)'))
    expect(page).to(have_content(anon_comment.content))
    expect(page).to(have_content(member2.name))
  end

  # --- Rainy Day: Admin can't post anonymous comment ---
  it 'Admin can not post anonymous comment' do
    sign_in(admin)
    visit announcement_path(announcement)

    expect(page).not_to(have_selector("input[type=checkbox][name='comment[anonymous]']"))
  end
end
