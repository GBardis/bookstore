class AuthorsController < ApplicationController
  def create
    author = Author.new(author_params)
    if author.save
      render json: author, status: :ok
    else
      render json: { errors: author.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def author_params
    params.permit(:id, :email, :first_name, :last_name, :date_of_birth)
  end
end
