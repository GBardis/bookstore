class PublishersController < ApplicationController
  def create
    publisher = Publisher.new(publisher_params)
    if publisher.save
      render json: publisher, status: :ok
    else
      render json: { errors: publisher.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def publisher_params
    params.permit(:id, :name, :telephone, :address)
  end
end
