class BooksController < ApplicationController
  before_action :set_book, only: %i[show update destroy]

  def index
    books = Book.includes(:authors).where('publisher_id != ? AND visibility = ?', 0, 0)
                .order('authors.last_name ASC')
                .sort do |a, b|
      -(a.authors.first.id <=> b.authors.first.id)
    end
    books.each do |book|
      book.description = book.description.truncate(100, omission: '...')
    end
    render json: enrich_index_response(books),
           status: :ok
  end

  def show
    render json: enrich_show_response(@book), status: :ok
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: book, status: :ok
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: @book, status: :ok
    else
      render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    render json: @book, status: :ok if @book.destroy
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def enrich_show_response(book)
    book_author = book.authors
    book_publisher = book.publisher
    book = book.attributes
    book['author_full_name'] = book_author.first.full_name
    book['author_email'] = book_author.first.email
    book['author_date_of_birth'] = book_author.first.date_of_birth
    book['publisher_name'] = book_publisher.name
    book['publisher_address'] = book_publisher.address
    book.except!('created_at', 'updated_at', 'visibility', 'publisher_id', 'id')
    book
  end

  def enrich_index_response(books)
    book_collection = []
    books.each do |book|
      author = book.authors.first
      book = book.attributes
      book['author_full_name'] = author.full_name
      book.except!('created_at', 'updated_at', 'visibility', 'publisher_id', 'id', 'creation_date')
      book_collection << book
    end
    book_collection
  end

  def book_params
    params.permit(:id, :title, :description, :isbn, :visibility, :creation_date, :publisher_id, author_ids: [])
  end
end
