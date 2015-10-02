class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :check, :flag]

  def show

    render json: @game.as_json
  end

  def flag
    row = params[:row].to_i
    col = params[:col].to_i
    @game.flag(row, col)
    @game.update(board: @game.board)
    render json: @game.as_json
  end

  def check
    row = params[:row].to_i
    col = params[:col].to_i
    @game.check(row, col)
    @game.update(board: @game.board)
    render json: @game.as_json
  end




  def create
    @game = Game.create(difficulty: params[:difficulty], state: "new")
    render json: @game.as_json, status: :created
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.permit(:difficulty)
  end
end
