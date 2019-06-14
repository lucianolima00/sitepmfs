require "application_system_test_case"

class AvaliationQuestionsTest < ApplicationSystemTestCase
  setup do
    @avaliation_question = avaliation_questions(:one)
  end

  test "visiting the index" do
    visit avaliation_questions_url
    assert_selector "h1", text: "Avaliation Questions"
  end

  test "creating a Avaliation question" do
    visit avaliation_questions_url
    click_on "New Avaliation Question"

    fill_in "Statement", with: @avaliation_question.Statement
    fill_in "Alta", with: @avaliation_question.altA
    fill_in "Altb", with: @avaliation_question.altB
    fill_in "Altc", with: @avaliation_question.altC
    fill_in "Altd", with: @avaliation_question.altD
    fill_in "Alte", with: @avaliation_question.altE
    fill_in "Avaliation", with: @avaliation_question.avaliation_id
    click_on "Create Avaliation question"

    assert_text "Avaliation question was successfully created"
    click_on "Back"
  end

  test "updating a Avaliation question" do
    visit avaliation_questions_url
    click_on "Edit", match: :first

    fill_in "Statement", with: @avaliation_question.Statement
    fill_in "Alta", with: @avaliation_question.altA
    fill_in "Altb", with: @avaliation_question.altB
    fill_in "Altc", with: @avaliation_question.altC
    fill_in "Altd", with: @avaliation_question.altD
    fill_in "Alte", with: @avaliation_question.altE
    fill_in "Avaliation", with: @avaliation_question.avaliation_id
    click_on "Update Avaliation question"

    assert_text "Avaliation question was successfully updated"
    click_on "Back"
  end

  test "destroying a Avaliation question" do
    visit avaliation_questions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Avaliation question was successfully destroyed"
  end
end
