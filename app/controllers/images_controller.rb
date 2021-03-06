class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :update, :destroy]

  # fetch images on backend side(fetch in index in rails, rest client, assign images to teams)


  # GET /images
  def index
    if params[:game_id]
      @game = Game.find_by_id(params[:game_id])
      @images = @game.images
    else
      @images = Image.all
    end
    render json: @images
  end

  # GET /images/1
  def show
    render json: @image
  end

  # POST /images
  def create
    @image = Image.new(image_params)

    if @image.save
      render json: @image, status: :created, location: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def image_params
      params.require(:image).permit(:url, :team)
    end
end


