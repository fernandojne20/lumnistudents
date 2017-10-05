require 'test_helper'

class NoteSubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @note_subject = note_subjects(:one)
  end

  test "should get index" do
    get note_subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_note_subject_url
    assert_response :success
  end

  test "should create note_subject" do
    assert_difference('NoteSubject.count') do
      post note_subjects_url, params: { note_subject: { subject_id: @note_subject.subject_id, user_id: @note_subject.user_id, value: @note_subject.value } }
    end

    assert_redirected_to note_subject_url(NoteSubject.last)
  end

  test "should show note_subject" do
    get note_subject_url(@note_subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_note_subject_url(@note_subject)
    assert_response :success
  end

  test "should update note_subject" do
    patch note_subject_url(@note_subject), params: { note_subject: { subject_id: @note_subject.subject_id, user_id: @note_subject.user_id, value: @note_subject.value } }
    assert_redirected_to note_subject_url(@note_subject)
  end

  test "should destroy note_subject" do
    assert_difference('NoteSubject.count', -1) do
      delete note_subject_url(@note_subject)
    end

    assert_redirected_to note_subjects_url
  end
end
