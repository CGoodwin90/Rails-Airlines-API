class Api::V1::AirlinesController < ApplicationController
  before_action :set_airline, only: [:show, :update, :destroy]
    
  def index
    @airlines = Airline.all

    render json: @airlines
  end

  def show
    render json: @airline
  end

  def create
    @airline = Airline.new(airline_params)

    if @airline.save
      render json: @airline, status: :created
    else
      render json: @airline.errors, status: :unprocessable_entity
    end
  end

  def update
    if @airline.update(airline_params)
      render json: @airline
    else
      render json: @airline.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @airline.destroy
    head :no_content
  end

  private
    def set_airline
      @airline = Airline.find(params[:id])
    end

    def airline_params
      params.require(:airline).permit(:name)
    end
end
