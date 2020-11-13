class ApplicationController < ActionController::API
  rescue_from NoMethodError, with: :no_method
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_record
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

  private
  def not_destroyed(e)
    render json: { errors: e.record.errors }, status: :unprocessable_entity
  end

  def no_method(e)
    puts ""
    return render json: { errors: e.record.errors }, status: :unprocessable_entity 
  end

  def not_found_record(e)
    return render json: { errors: e.record.errors }, status: :not_found
  end
end
