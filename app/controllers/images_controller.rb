class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :update, :destroy]

  # fetch images on backend side(fetch in index in rails, rest client, assign images to teams)


  # GET /images
  def index
    @images = fetchImages()

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
      params.require(:image).permit(:url)
    end
end

def fetchImages() 
  page_num = rand(1..40)
  num_pics = 25
  images_url = "https://picsum.photos/v2/list?page=#{page_num}&limit=#{num_pics}"

  data = JSON.parse(RestClient.get("#{images_url}"))

  data.each.with_index(1) do |image, index|
      newer_image = Image.new(url: image["download_url"])
      if index.even?
          newer_image.team = "team1"
      elsif index == 17
          newer_image.team = "dead"
      else
         newer_image.team = "team2"
      end
      newer_image.save
      # binding.pry
  end
end
