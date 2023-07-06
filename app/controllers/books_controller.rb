class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :index]
  before_action :correct_user, only: [:edit, :update]
  def new
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new

  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @books = Book.all

  end
  def top

  end
  def destroy
    @book = Book.find(params[:id])
    user = @book.user
    @book.destroy

    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end
  def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  @user = current_user
  if @book.save
    flash[:notice] = "You have created book successfully."
    @user = @book.user
    @books = Book.all
    redirect_to book_path(@book)
  else
    @books = Book.all
    render :index
  end
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end


  private
  def book_params
  params.require(:book).permit(:title, :body)
  end
   def correct_user
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end

end
