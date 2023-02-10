class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid

    private

    def not_found exception
        render json: {error: "#{exception.model} not Found"}, status: :not_found
    end

    def invalid invalid
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
