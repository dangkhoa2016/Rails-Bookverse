require "application_system_test_case"

class MembersTest < ApplicationSystemTestCase
  setup do
    @member = members(:one)
  end

  test "visiting the index" do
    visit members_url
    assert_selector "h2", text: "List of Members"
  end

  test "should create member" do
    visit members_url
    click_on "New Member"
    assert_selector "h2", text: "New Member"

    page.execute_script(<<~JS)
      var sel = document.querySelector("select[name='member[library_id]']");
      sel.removeAttribute('disabled');
      sel.add(new Option("", "#{@member.library_id}", true, true));
    JS
    check "Active" if @member.active
    fill_in "member_first_name", with: @member.first_name
    fill_in "member_last_name", with: @member.last_name
    fill_in "member_email", with: "new_#{@member.email}"
    click_on "Create Member"

    assert_text "was successfully created"
    click_on "Back to Members"
  end

  test "should update Member" do
    visit edit_member_url(@member)

    check "Active" if @member.active
    fill_in "member_first_name", with: @member.first_name
    fill_in "member_last_name", with: @member.last_name
    fill_in "member_email", with: @member.email
    click_on "Update Member"

    assert_text "was successfully updated"
    click_on "Back to Members"
  end

  test "should destroy Member" do
    visit member_url(@member)
    find("#member_#{@member.id} > .card-footer").click_on "Delete"
    click_on "Yes"

    assert_text "has been destroyed"
  end
end
