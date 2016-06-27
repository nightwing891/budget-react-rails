class Api::BoardsController < ApplicationController
  def index
    render json: Board.all
  end

  def create
    board = Board.new(board_params)
    if board.save
      render json: board
    else
      render json: {errors: board.errors.full_messages }
    end
  end

  def update
    board = Board.find(params[:id])
    board.update(complete: !board.complete)
    render json: board
  end

  def destroy
    Board.find(params[:id]).destroy
    render json: { message: 'Item Deleted' }
  end

  private

    def board_params
        params.require(:board).permit(:category, :sub_category, :money_value)
    end
end
