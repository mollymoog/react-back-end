class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]

  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    @game = Game.find_by_id(params[:id])
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    @team1 = @game.teams.build(team_name: params["name"], color: params["color"])

    if @game.save
        page_num = rand(1..40)
        num_pics = 25
        images_url = "https://picsum.photos/v2/list?page=#{page_num}&limit=#{num_pics}"
      
        data = JSON.parse(RestClient.get("#{images_url}"))
      
        data.each.with_index(1) do |image, index|

            image = @game.images.build(url: image["download_url"])
            if index.even?
                image.team_id = @team1.id
                image.color = @team1.color
                image.save
            else
               image.team_id = 62
               image.color = "#FFFFFF"
               image.save
            end
        end 
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.fetch(:game, {}, image_attributes: [:url, :team_id, :game_id], team_attributes: [:team_name, :color])

    end
end
