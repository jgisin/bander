class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def new
    @band = Band.find(params[:band_id])
    @song = Song.new
  end

  def create
    @band = Band.find(params[:band_id])
    @song = @band.songs.build(song_params)
    if @song.save
      respond_to do |format|
        format.html { redirect_to @band }
        format.json { render json: { name: @song.name } }
      end
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    if @song.destroy
      redirect_to :back
    end
  end

  def update
    if @song.update(song_params)
      redirect_to [@band, @song]
    else
      render :edit
    end
  end

  def lyrics

  end

  def sort
    params[:song].each_with_index do |id, index|
      song = Song.find(id)
      song.update(position: index + 1)
    end
    render nothing: true
    # respond_to do |format|
    #   format.json { render json: {success: true}}
    # end
  end

  private

  def set_song
    @band = Band.find(params[:band_id])
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :band_id, :lyrics)
  end
end
