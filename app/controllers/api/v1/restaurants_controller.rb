module Api
  module V1
    class RestaurantsController < ApplicationController

      def index
        @restaurants = Restaurant.all
        render json: { status: :success, restaurants: @restaurants, total: @restaurants.count }, status: :ok
      end

      def show
        @restaurants = set_restaurant
        render json: { status: :success, restaurants: @restaurants }, status: :ok
      end

      def new
        @restaurants = Restaurant.new
      end

      def edit
      end

      def create
        @restaurants = Restaurant.new(restaurant_params)
        if @restaurants.save
          render json: @restaurants, status: :created
        else
          render json: { error: @restaurants.errors }, status: :unprocessable_entity
        end
      end

      def update
        @restaurants = set_restaurant
        if @restaurants.update(restaurant_params)
          render json: { status: :success, restaurants: @restaurants }, status: :ok
        else
          render json: { error: @restaurants.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @restaurants = set_restaurant
        @restaurants.destroy
        head :no_content
      end

      private
        def set_restaurant
          @restaurants = Restaurant.find(params[:id])
        end

        def restaurant_params
          params.require(:restaurant).permit(:name)
        end
    end
  end
end
