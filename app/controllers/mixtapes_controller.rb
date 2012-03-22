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
    current_user_can? :listen, @mixtape
      
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mixtape }
    end
  end

  # GET /mixtapes/new
  # GET /mixtapes/new.json
  def new
    @mixtape = Mixtape.new
    @songs = @mixtape.songs.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mixtape }
    end
  end

  # GET /mixtapes/1/edit
  def edit
    @mixtape = current_user.mixtapes.find(params[:id])
    current_user_can? :edit, @mixtape
  end

  # POST /mixtapes
  # POST /mixtapes.json
  def create
    # Seperate Scopes
    # @mixtape = Mixtape.new(params[:mixtape])
    # @song = @mixtape.songs.build(params[:song])
    
    # nested_attributes / fields_for
    @mixtape = Mixtape.new(params[:mixtape])
    @mixtape.owner = current_user

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
    @mixtape = Mixtape.find(params[:id])
    current_user_can? :edit, @mixtape
    
    respond_to do |format|
      if @mixtape.update_attributes(params[:mixtape])
        format.html { redirect_to @mixtape, notice: 'Mixtape was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mixtape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mixtapes/1
  # DELETE /mixtapes/1.json
  def destroy
    @mixtape = Mixtape.find(params[:id])
    return if !current_user_can? :destroy, @mixtape
    
    @mixtape.destroy

    respond_to do |format|
      format.html { redirect_to mixtapes_url }
      format.json { head :no_content }
    end
  end
  
end
