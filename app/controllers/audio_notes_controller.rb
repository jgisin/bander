class AudioNotesController < ApplicationController
  def create
    @audio_note = AudioNote.new(audio_note_params)
    if @audio_note.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private

  def audio_note_params
    params.require(:audio_note).permit(:time, :note, :audio_clip_id)
  end
end
