class TicTacToeController < ApplicationController
  def options
  end

  def game
    @game = build_game(params)
    @game_options = build_game_options(params)
    puts(@game.next_player.type)
    redirect_to(action: :result, moves: @game.board.moves) if @game.complete?
  end

  def result
    @board = build_board(params)
  end

  private

  def build_game(params)
    MattsTictactoeCore::Game.new(
      player_x_type: params[:player_x_type].to_sym,
      player_o_type: params[:player_o_type].to_sym,
      board: build_board(params))
  end

  def build_board(params)
    moves = get_moves(params)
    move = get_move(params)
    board = MattsTictactoeCore::Board.new(moves)
    active_game?(params) ? board.move(move) : board
  end

  def active_game?(params)
    params.has_key?(:move)
  end

  def get_moves(params)
    params.fetch(:moves, []).map(&:to_i)
  end

  def get_move(params)
    params[:move].to_i
  end

  def build_game_options(params)
    build_game_state(params).merge(build_computer_move)
  end

  def build_game_state(params)
    { action: :game,
      player_x_type: params[:player_x_type],
      player_o_type: params[:player_o_type],
      moves: @game.board.moves }
  end

  def build_computer_move
    @game.next_player.type == :computer ? get_computer_player_move : {} 
  end

  def get_computer_player_move
    { move: @game.next_player.get_move(@game.board) }
  end
end
