class CreateNoteSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :note_subjects do |t|
      t.integer :value
      t.integer :subject_id
      t.integer :user_id

      t.timestamps
    end
  end
end
