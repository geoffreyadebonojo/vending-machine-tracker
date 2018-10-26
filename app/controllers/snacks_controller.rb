class SnacksController < ApplicationController
  def index
    @snack = Snack.all
  end

  def show
    @snack = Snack.find(params[:id])
  end
end
