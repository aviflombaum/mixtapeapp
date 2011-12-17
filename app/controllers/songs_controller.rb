class SongsController < ApplicationController
  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.page(params[:page]).order("name ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json {render :json => {:html => (render_to_string :partial => 'songs/song_tr.html', :collection => @songs, :as => :song)}}
      # index.json.erb
    end
  end
  
  # GET /songs/search
  # GET /songs/search.json
  def search
    @songs = Song.starts_with(params[:q])

    respond_to do |format|
      format.html # index.html.erb
      format.json { 
        render json: @songs.to_json(:only => [:id, :name], 
                                    :methods => :artist_name) # n+1
      }
    end    
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/new
  # GET /songs/new.json
  def new
    @song = Song.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(params[:song])

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :ok }
    end
  end
end
