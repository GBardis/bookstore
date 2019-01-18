class BooksController < ApplicationController
  before_action :set_book, only: %i[show new update delete]

  def index
    books = Book.includes(:authors).where('publisher_id != 0')
                .order('authors.last_name ASC')
                .sort do |a, b|
      -(a.authors.first.id <=> b.authors.first.id)
    end
    books.each do |book|
      book.description = book.description.truncate(100, omission: '...')
    end
    render json: books,
           status: :ok
  end

  def show
    render json: enrich_book(@book), status: :ok
  end

  def create; end

  def update; end

  def destroy; end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def enrich_book(book)
    book_author = book.authors
    book_publisher = book.publisher
    book = book.attributes
    book['full_name'] = book_author.first.full_name
    book['email'] = book_author.first.email
    book['date_of_birth'] = book_author.first.date_of_birth
    book['publisher_name'] = book_publisher.name
    book['address'] = book_publisher.address
    book.except!('created_at', 'update_at', 'visibility')
    book
  end
end
