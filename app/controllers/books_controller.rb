class BooksController < ApplicationController

 def new
   @book = Book.new
 end

 def index
  @books = Book.all
  @book = Book.new
 end

 def create
  @book = Book.new(book_params)
  if @book.save
    flash[:now] = "Book was successfully created."
    redirect_to book_path(@book)
  else
    @books = Book.all
    render 'error'
  end
 end

 def update
  @books = Book.all
  @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:now] = "Book was successfully updated."
    redirect_to book_path(@book.id)
  else
  render 'edit_error'
  end
 end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to "/books"
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
