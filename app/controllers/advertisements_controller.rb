class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new
    @advertisement.title = params[:post][:title]
    @advertisement.body = params[:post][:body]
    @advertisement.price = params[:post][:price]
  end
end
