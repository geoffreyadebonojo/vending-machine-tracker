class SnacksController < ApplicationController
  def index
    @snack = Snack.all
  end

  def show
    @snack = Snack.find(params[:id])
  end

  def self.avg_price
    @avg = average(:price)
  end
end
