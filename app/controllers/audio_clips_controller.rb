class AudioClipsController < ApplicationController

  def new
    @band = Band.find(params[:band_id])
    @song = Song.find(params[:song_id])
    @audio_clip = AudioClip.new
  end

  def create
    @band = Band.find(params[:band_id])
    @song = Song.find(params[:song_id])
    @audio_clip = @song.audio_clips.build(audio_clip_params)
    if @song.save
      redirect_to [@band, @song]
    else
      render :new
    end
  end

  private

  def audio_clip_params
    params.require(:audio_clip).permit(:audio_file)
  end

end
