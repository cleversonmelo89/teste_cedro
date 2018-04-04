module Api
  module V1
    class PlatesController < ApplicationController

      def index
        @plates = Plate.all
        render json: { status: :success, plates: @plates, total: @plates.count }, status: :ok
      end

      def show
        @plates = set_plate
        render json: { status: :success, plates: @plates }, status: :ok
      end

      def new
        @plates = Plate.new
      end

      def edit
      end

      def create
        @plates = Plate.new(plate_params)
        if @plates.save
          render json: @plates, status: :created
        else
          render json: { error: @plates.errors }, status: :unprocessable_entity
        end
      end

      def update
        debugger
        @plates = set_plate
        if @plates.update(plate_params)
          render json: { status: :success, plates: @plates }, status: :ok
        else
          render json: { error: @plates.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @plates = set_plate
        @plates.destroy
        head :no_content
      end

      private
        def set_plate
          @plates = Plate.find(params[:id])
        end

        def plate_params
          params.require(:plate).permit(:name, :price, :restaurants_id)
        end
    end
  end
end
