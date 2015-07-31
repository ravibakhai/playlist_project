class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :confirmation, :edit, :update, :destroy]

  # GET /playlists
  # GET /playlists.json
  def index
    @page = (params[:page] || 1).to_i
    @offset = (@page - 1) * 8
    @playlists = Playlist.
      order(created_at: :desc).
      limit(8).
      offset(@offset).
      all
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
    @review = Review.new
  end

  def confirmation
    @review = Review.new
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
  end

  # GET /playlists/1/edit
  def edit
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @playlist = Playlist.new(playlist_params)

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to confirmation_playlist_path(@playlist), notice: 'Playlist was successfully created.' }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to confirmation_playlist_path(@playlist), notice: 'Playlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: 'Playlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @playlist = Playlist.find(params[:id])
    @playlist.votes.create
    redirect_to(playlists_path)
  end

  def downvote
    @playlist = Playlist.find(params[:id])
    @playlist.downvotes.create
    redirect_to(playlists_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playlist_params
      params.require(:playlist).permit(:name, :url, :image, :description, :comment)
    end
end
