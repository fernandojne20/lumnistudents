class NoteSubjectsController < ApplicationController
  before_action :set_note_subject, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_inputs

  # GET /note_subjects
  # GET /note_subjects.json
  def index
    @note_subjects = NoteSubject.where(user_id: current_user.id)
  end

  # GET /note_subjects/1
  # GET /note_subjects/1.json
  def show
  end

  # GET /note_subjects/new
  def new
    @note_subject = NoteSubject.new
  end

  # GET /note_subjects/1/edit
  def edit
  end

  # POST /note_subjects
  # POST /note_subjects.json
  def create
    @note_subject = NoteSubject.new(params_with_user_modifier(note_subject_params))

    respond_to do |format|
      if @note_subject.save
        format.html { redirect_to @note_subject, notice: 'Note subject was successfully created.' }
        format.json { render :show, status: :created, location: @note_subject }
      else
        format.html { render :new }
        format.json { render json: @note_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /note_subjects/1
  # PATCH/PUT /note_subjects/1.json
  def update
    respond_to do |format|
      if @note_subject.update(note_subject_params)
        format.html { redirect_to @note_subject, notice: 'Note subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @note_subject }
      else
        format.html { render :edit }
        format.json { render json: @note_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /note_subjects/1
  # DELETE /note_subjects/1.json
  def destroy
    @note_subject.destroy
    respond_to do |format|
      format.html { redirect_to note_subjects_url, notice: 'Note subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_inputs
      @subjects = Subject.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_note_subject
      @note_subject = NoteSubject.find_by(id: params[:id], user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_subject_params
      params.require(:note_subject).permit(:value, :subject_id)
    end

    def params_with_user_modifier(model_params)
      model_params.merge({user_id: current_user.id})
    end
end
