class NoteSubject < ApplicationRecord

	validates :value, presence: true
	validates :subject, uniqueness: { scope: :user }
	belongs_to :subject
	belongs_to :user
end
