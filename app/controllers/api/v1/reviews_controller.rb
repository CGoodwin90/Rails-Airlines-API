class Api::V1::ReviewsController < ApplicationController
    before_action :set_review, only: [:destroy]

    def create
        @review = Review.new(review_params)

        if @review.save
            render json: @review, status: :created
        else
            render json: @review.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @review.destroy
        head :no_content
    end
    
    private
    def set_review
        @review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:content, :airline_id)
    end
end
