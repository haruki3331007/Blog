class BooksController < ApplicationController
    before_action :correct_user, only: [:edit, :update]

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      flash[:newbook] = "You have created book successfully."
      redirect_to book_path(@new_book)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @new_book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @new_book = Book.new
    @book_comment = BookComment.new
    @book = Book.find(params[:id])
    @id = @book.user_id
    @user = User.find(@id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:editbook] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    redirect_to(books_path) unless  @book.user == current_user
  end
end
