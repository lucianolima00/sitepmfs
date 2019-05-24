require "application_system_test_case"

class AnswersTest < ApplicationSystemTestCase
  setup do
    @answer = answers(:one)
  end

  test "visiting the index" do
    visit answers_url
    assert_selector "h1", text: "Answers"
  end

  test "creating a Answer" do
    visit answers_url
    click_on "New Answer"

    fill_in "Answers[]", with: @answer.answers[]
    fill_in "Grade", with: @answer.grade
    fill_in "Questionnaire", with: @answer.questionnaire_id
    fill_in "Student id", with: @answer.student_id_id
    click_on "Create Answer"

    assert_text "Answer was successfully created"
    click_on "Back"
  end

  test "updating a Answer" do
    visit answers_url
    click_on "Edit", match: :first

    fill_in "Answers[]", with: @answer.answers[]
    fill_in "Grade", with: @answer.grade
    fill_in "Questionnaire", with: @answer.questionnaire_id
    fill_in "Student id", with: @answer.student_id_id
    click_on "Update Answer"

    assert_text "Answer was successfully updated"
    click_on "Back"
  end

  test "destroying a Answer" do
    visit answers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Answer was successfully destroyed"
  end
end
