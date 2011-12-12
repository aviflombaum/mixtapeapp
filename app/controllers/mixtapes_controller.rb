class MixtapesController < ApplicationController
  before_filter :login_required
  
  # GET /mixtapes
  # GET /mixtapes.json
  def index
    @mixtapes = current_user.mixtapes

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mixtapes }
    end
  end

  # GET /mixtapes/1
  # GET /mixtapes/1.json
  def show
    @mixtape = current_user.mixtapes.find(params[:id])

    if request.path != mixtape_path(@mixtape)
      return redirect_to @mixtape, :status => :moved_permanently
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mixtape }
    end
  end

  # GET /mixtapes/new
  # GET /mixtapes/new.json
  def new
    @mixtape = current_user.mixtapes.build(:playlists => [Playlist.new])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mixtape }
    end
  end

  # GET /mixtapes/1/edit
  def edit
    @mixtape = current_user.mixtapes.find(params[:id])
  end

  # POST /mixtapes
  # POST /mixtapes.json
  def create
    @mixtape = current_user.mixtapes.build(params[:mixtape])

    respond_to do |format|
      if @mixtape.save
        format.html { redirect_to @mixtape, notice: 'Mixtape was successfully created.' }
        format.json { render json: @mixtape, status: :created, location: @mixtape }
      else
        format.html { render action: "new" }
        format.json { render json: @mixtape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mixtapes/1
  # PUT /mixtapes/1.json
  def update
    @mixtape = current_user.mixtapes.find(params[:id])
    
    respond_to do |format|
      if @mixtape.update_attributes(params[:mixtape])
        format.html { redirect_to @mixtape, notice: 'Mixtape was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @mixtape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mixtapes/1
  # DELETE /mixtapes/1.json
  def destroy
    @mixtape = current_user.mixtapes.find(params[:id])
    @mixtape.destroy

    respond_to do |format|
      format.html { redirect_to mixtapes_url }
      format.json { head :ok }
    end
  end
end
