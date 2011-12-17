class SharesController < ApplicationController
  
  def new
    @mixtape = Mixtape.find(params[:mixtape_id])
  end
end
