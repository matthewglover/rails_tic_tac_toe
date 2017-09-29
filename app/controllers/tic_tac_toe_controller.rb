class TicTacToeController < ApplicationController
  def options
  end

  def game
    @game = build_game(params)
    @game_options = {
      action: :game,
      player_x_type: params[:player_x_type],
      player_o_type: params[:player_o_type],
      moves: @game.board.moves.join(",")
    }
  end

  private

  def build_game(params)
    MattsTictactoeCore::Game.new(
      player_x_type: params[:player_x_type],
      player_o_type: params[:player_o_type],
      board: build_board(params))
  end

  def build_board(params)
    moves = get_moves(params)
    move = get_move(params)
    board = MattsTictactoeCore::Board.new(moves)
    active_game?(params) ? board.move(move) : board
  end

  def active_game?(params)
    params.has_key?("move")
  end

  def get_moves(params)
    params.fetch("moves", "").split(",").map(&:to_i)
  end

  def get_move(params)
    params["move"].to_i
  end
end
