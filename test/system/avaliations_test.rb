require "application_system_test_case"

class AvaliationsTest < ApplicationSystemTestCase
  setup do
    @avaliation = avaliations(:one)
  end

  test "visiting the index" do
    visit avaliations_url
    assert_selector "h1", text: "Avaliations"
  end

  test "creating a Avaliation" do
    visit avaliations_url
    click_on "New Avaliation"

    check "Model" if @avaliation.model
    fill_in "Teacher", with: @avaliation.teacher_id
    click_on "Create Avaliation"

    assert_text "Avaliation was successfully created"
    click_on "Back"
  end

  test "updating a Avaliation" do
    visit avaliations_url
    click_on "Edit", match: :first

    check "Model" if @avaliation.model
    fill_in "Teacher", with: @avaliation.teacher_id
    click_on "Update Avaliation"

    assert_text "Avaliation was successfully updated"
    click_on "Back"
  end

  test "destroying a Avaliation" do
    visit avaliations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Avaliation was successfully destroyed"
  end
end
